// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_mappable/dart_mappable.dart';

part 'item_response.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class ItemResponse with ItemResponseMappable {
  final bool? error;
  final String? message;
  final List<ItemData>? data;
  final int? code;

  const ItemResponse({
    this.error,
    this.message,
    this.data,
    this.code,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase, ignoreNull: true)
class ItemData with ItemDataMappable {
  final int? id;
  final String? name;
  final String? slug;
  final String? description;
  final int? price;
  final double? latitude;
  final double? longitude;
  final String? address;
  final String? contact;
  final int? showOnlyToPremium;
  final String? status;
  final String? videoLink;
  final String? city;
  final String? state;
  final String? country;
  final int? userId;
  final int? categoryId;
  final String? allCategoryIds;
  final String? expiryDate;
  final int? clicks;
  final String? createdAt;
  final String? updatedAt;
  final int? isEditedByAdmin;
  final int? packageId;
  final String? translatedName;
  final String? translatedDescription;

  final User? user;
  final Category? category;
  final TranslatedItem? translatedItem;

  final List<dynamic>? galleryImages;
  final List<dynamic>? featuredItems;
  final List<dynamic>? favourites;

  final bool? isFeature;
  final int? totalLikes;
  final bool? isLiked;

  final List<dynamic>? customFields;

  const ItemData({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.price,
    this.latitude,
    this.longitude,
    this.address,
    this.contact,
    this.showOnlyToPremium,
    this.status,
    this.videoLink,
    this.city,
    this.state,
    this.country,
    this.userId,
    this.categoryId,
    this.allCategoryIds,
    this.expiryDate,
    this.clicks,
    this.createdAt,
    this.updatedAt,
    this.isEditedByAdmin,
    this.packageId,
    this.translatedName,
    this.translatedDescription,
    this.user,
    this.category,
    this.translatedItem,
    this.galleryImages,
    this.featuredItems,
    this.favourites,
    this.isFeature,
    this.totalLikes,
    this.isLiked,
    this.customFields,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase, ignoreNull: true)
class User with UserMappable {
  final int? id;
  final String? name;
  final String? email;
  final String? mobile;
  final String? profile;
  final String? countryCode;
  final int? reviewsCount;
  final double? averageRating;
  final List<dynamic>? sellerReview;

  const User({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.profile,
    this.countryCode,
    this.reviewsCount,
    this.averageRating,
    this.sellerReview,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase, ignoreNull: true)
class Category with CategoryMappable {
  final int? id;
  final String? name;
  final String? image;
  final int? isJobCategory;
  final int? priceOptional;
  final String? translatedName;
  final String? translatedDescription;
  final List<dynamic>? translations;

  const Category({
    this.id,
    this.name,
    this.image,
    this.isJobCategory,
    this.priceOptional,
    this.translatedName,
    this.translatedDescription,
    this.translations,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase, ignoreNull: true)
class TranslatedItem with TranslatedItemMappable {
  final String? name;
  final String? description;
  final String? address;
  final String? city;
  final String? state;
  final String? country;
  final String? rejectedReason;
  final String? adminEditReason;

  const TranslatedItem({
    this.name,
    this.description,
    this.address,
    this.city,
    this.state,
    this.country,
    this.rejectedReason,
    this.adminEditReason,
  });
}
