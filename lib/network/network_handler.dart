import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_intercept_to_curl/dio_intercept_to_curl.dart';
import 'package:flutter/foundation.dart';
import 'package:http_cache_hive_store/http_cache_hive_store.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constant/app_strings.dart';
import '../exceptions/exceptions.dart';
import '../utils/secure_storage.dart';

final networkHandlerProvider = Provider<NetworkHandler>((ref) {
  return NetworkHandler();
});

class NetworkHandler {
  late final Dio _dio;

  NetworkHandler() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 90),
        receiveTimeout: const Duration(seconds: 90),
      ),
    );

    if (kDebugMode) {
      _dio.interceptors.add(DioInterceptToCurl(printOnSuccess: true));
    }

    _initCache();
  }

  Future<void> _initCache() async {
    final cacheDir = await getApplicationCacheDirectory();
    final store = HiveCacheStore(cacheDir.path, hiveBoxName: "requestsBox");
    final cacheOptions = CacheOptions(
      store: store,
      policy: CachePolicy.request,
      priority: CachePriority.high,
      maxStale: const Duration(days: 1),
      hitCacheOnErrorCodes: [401, 404],
      allowPostMethod: false,
    );
    _dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
  }

  // ========================= Base Requests =========================

  Future<Response> get(
      {required String endpoint,
        Map<String, dynamic>? queryParams,
        Map<String, String>? headers,
        CancelToken? cancelToken}) async {
    return _handleRequest(() => _dio.get(
      endpoint,
      queryParameters: queryParams,
      options: Options(headers: headers),
      cancelToken: cancelToken,
    ));
  }

  Future<Response> post(
      {required String endpoint,
        Map<String, dynamic>? data,
        Map<String, dynamic>? queryParams,
        Map<String, String>? headers,
        CancelToken? cancelToken}) async {
    return _handleRequest(() => _dio.post(
      endpoint,
      data: data,
      queryParameters: queryParams,
      options: Options(headers: headers),
      cancelToken: cancelToken,
    ));
  }

  Future<Response> put(
      {required String endpoint,
        Map<String, dynamic>? data,
        Map<String, dynamic>? queryParams,
        Map<String, String>? headers}) async {
    return _handleRequest(() => _dio.put(
      endpoint,
      data: data,
      queryParameters: queryParams,
      options: Options(headers: headers),
    ));
  }

  Future<Response> delete(
      {required String endpoint,
        Map<String, dynamic>? data,
        Map<String, dynamic>? queryParams,
        Map<String, String>? headers}) async {
    return _handleRequest(() => _dio.delete(
      endpoint,
      data: data != null ? jsonEncode(data) : null,
      queryParameters: queryParams,
      options: Options(headers: headers),
    ));
  }

  // ========================= Multipart Requests =========================

  Future<Response> postMultipartFormData({
    required String endpoint,
    required FormData formData,
    Map<String, String>? headers,
  }) async {
    try {
      print("DEBUG: Sending request to $endpoint");

      final response = await _dio.post(
        endpoint,
        data: formData,
        options: Options(
          headers: headers,
          contentType: "multipart/form-data",
        ),
      );

      print("DEBUG: Raw Response received: ${response.statusCode}");

      // 🔥 FIX: Return the whole 'response', NOT 'response.data'
      return response;

    } on DioException catch (e) {
      print("DEBUG: Dio Error: ${e.message}");
      print("DEBUG: Response Data: ${e.response?.data}");
      rethrow;
    } catch (e) {
      print("DEBUG: Unexpected Error: $e");
      rethrow;
    }
  }

  Future<Response> putMultipart(
      {required String endpoint,
        Map<String, dynamic>? data,
        Map<String, dynamic>? queryParams,
        Map<String, String>? headers}) async {
    final formData = await _prepareFormData(data);
    return _handleRequest(() => _dio.put(
      endpoint,
      data: formData,
      queryParameters: queryParams,
      options: Options(headers: headers),
    ));
  }

  Future<FormData> _prepareFormData(Map<String, dynamic>? data) async {
    final formData = FormData();
    if (data == null) return formData;

    for (final entry in data.entries) {
      if (entry.value is File) {
        final file = entry.value as File;
        final mimeType = lookupMimeType(file.path);
        if (mimeType != null) {
          formData.files.add(MapEntry(
            entry.key,
            MultipartFile.fromFileSync(
              file.path,
              filename: file.path.split('/').last,
              contentType: DioMediaType.parse(mimeType),
            ),
          ));
        }
      } else {
        formData.fields.add(MapEntry(entry.key, entry.value.toString()));
      }
    }

    return formData;
  }

  // ========================= Error Handling =========================

  Future<Response> _handleRequest(Future<Response> Function() request) async {
    try {
      final response = await request();
      _validateResponse(response);
      _logResponse(response);
      return response;
    } on DioException catch (e) {
      _logError(e);
      throw _mapDioException(e);
    } catch (e) {
      throw ServerErrorException();
    }
  }

  void _validateResponse(Response response) {
    final code = response.statusCode ?? 0;
    if (code < 200 || code >= 300) {
      throw _mapStatusToException(code, response.data);
    }
  }

  void _logResponse(Response response) {
    if (!kDebugMode) return;
    debugPrint('--- HTTP Response ---');
    debugPrint('URL: ${response.requestOptions.uri}');
    debugPrint('Status: ${response.statusCode}');
    debugPrint('Data: ${response.data}');
  }

  void _logError(DioException e) {
    if (!kDebugMode) return;
    debugPrint('--- HTTP Error ---');
    debugPrint('URL: ${e.requestOptions.uri}');
    debugPrint('Error: ${e.error}');
    debugPrint('Response: ${e.response?.data}');
  }

  AppException _mapDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
        return ConnectionIssueException(response: e.response?.data);
      case DioExceptionType.badResponse:
        return _mapStatusToException(
            e.response?.statusCode, e.response?.data);
      default:
        return ServerErrorException(response: e.response?.data);
    }
  }

  AppException _mapStatusToException(int? statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
      case 404:
      case 405:
        return InvalidRequestException(response: data);
      case 401:
      case 403:
        return AuthenticationFailedException(response: data);
      case 408:
        return ConnectionIssueException(response: data);
      case 500:
        return ServerErrorException(response: data);
      case 503:
        return ServiceUnavailableException(
          response: data is Map
              ? data
              : {"responseMessage": AppStrings.serverCurrentlyUnavailable},
        );
      default:
        return ServerErrorException(response: data);
    }
  }

  // ========================= Headers =========================

  Future<Map<String, String>> getJsonHeaders({bool isPCs = false}) async {
    final token = isPCs
        ? await SecureStorageHelper.getPCSAccessToken()
        : await SecureStorageHelper.getAccessToken();
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Map<String, String>> getMultipartHeaders() async {
    final token = await SecureStorageHelper.getAccessToken();
    return {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer static_fake_token_123',
    };
  }
}
