import '../../../network/network_handler.dart';
import '../model/item_response.dart';

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
  }) async {
    final data = {
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
    };

    final response = await _network.postMultipart(
      endpoint: 'https://admin.shaqaty.com/api/add-item',
      data: data,
      headers: await _network.getMultipartHeaders(),
    );

    return ItemResponseMapper.fromMap(response.data);
  }
}
