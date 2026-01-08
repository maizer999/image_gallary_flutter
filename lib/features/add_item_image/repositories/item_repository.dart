import 'dart:io';
import 'package:multiple_result/multiple_result.dart';
import 'package:dio/dio.dart';

import '../../../exceptions/exceptions.dart';
import '../model/item_response.dart';
import '../service/add_item_service.dart';

class ItemRepository {
  final AddItemService _service;
  ItemRepository(this._service);

  Future<Result<ItemResponse, AppException>> addItem({
    required String name,
    required String description,
    required String categoryId,
    required String price,
    required String contact,
    String videoLink = "",
    String allCategoryIds = "",
    required String address,
    required String latitude,
    required String longitude,
    required String country,
    required String city,
    required String state,
    String showOnlyToPremium = "0",
    List<File>? galleryImages,
  }) async {
    try {
      // ✅ Convert List<File> to List<MultipartFile> before sending
      List<MultipartFile>? files;
      if (galleryImages != null && galleryImages.isNotEmpty) {
        files = galleryImages
            .map((file) => MultipartFile.fromFileSync(
          file.path,
          filename: file.path.split('/').last,
        ))
            .toList();
      }

      final response = await _service.addItem(
        name: name,
        description: description,
        categoryId: categoryId,
        price: price,
        contact: contact,
        videoLink: videoLink,
        allCategoryIds: allCategoryIds,
        address: address,
        latitude: latitude,
        longitude: longitude,
        country: country,
        city: city,
        state: state,
        showOnlyToPremium: showOnlyToPremium,
        galleryImages: files, // pass MultipartFile list
      );

      return Success(response);
    } on AppException catch (e) {
      return Error(e);
    } catch (_) {
      return Error(ServerErrorException());
    }
  }
}
