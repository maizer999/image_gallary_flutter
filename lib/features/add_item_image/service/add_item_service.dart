import 'package:dio/dio.dart';
import '../model/item_response.dart';
import '../../../network/network_handler.dart';

class AddItemService {
  final NetworkHandler _network = NetworkHandler();

  Future<ItemResponse> addItem({
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
    List<MultipartFile>? galleryImages,
  }) async {
    final formData = FormData.fromMap({
      "name": name,
      "description": description,
      "category_id": categoryId,
      "price": price,
      "contact": contact,
      "video_link": videoLink,
      "all_category_ids": allCategoryIds,
      "address": address,
      "latitude": latitude,
      "longitude": longitude,
      "country": country,
      "city": city,
      "state": state,
      "show_only_to_premium": showOnlyToPremium,
    });

    if (galleryImages != null && galleryImages.isNotEmpty) {
      for (final image in galleryImages) {
        formData.files.add(
          MapEntry("gallery_images[]", image),
        );
      }
    }

    // 🔹 PRINT REQUEST
    print('===== API REQUEST =====');
    print('Endpoint: /api/add-item');
    print('Fields:');
    formData.fields.forEach((f) {
      print('  ${f.key}: ${f.value}');
    });

    print('Files:');
    for (var f in formData.files) {
      print('  ${f.key}: ${f.value.filename}');
    }
    print('=======================');

    try {
      print("DEBUG: About to call network.postMultipartFormData");
      final response = await _network.postMultipartFormData(
        endpoint: 'https://admin.shaqaty.com/api/add-item',
        formData: formData,
        headers: await _network.getMultipartHeaders(),
      );

      // 🔹 PRINT RESPONSE
      print('===== API RESPONSE =====');
      print(response.data);
      print('========================');

      return ItemResponseMapper.fromMap(response.data);
    } on DioException catch (e) {
      print('===== API ERROR =====');
      print('Status: ${e.response?.statusCode}');
      print('Response: ${e.response?.data}');
      print('=====================');
      rethrow;
    }
  }
}
