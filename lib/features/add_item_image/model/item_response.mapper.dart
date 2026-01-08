// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'item_response.dart';

class ItemResponseMapper extends ClassMapperBase<ItemResponse> {
  ItemResponseMapper._();

  static ItemResponseMapper? _instance;
  static ItemResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ItemResponseMapper._());
      ItemDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ItemResponse';

  static bool? _$error(ItemResponse v) => v.error;
  static const Field<ItemResponse, bool> _f$error = Field(
    'error',
    _$error,
    opt: true,
  );
  static String? _$message(ItemResponse v) => v.message;
  static const Field<ItemResponse, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
  );
  static List<ItemData>? _$data(ItemResponse v) => v.data;
  static const Field<ItemResponse, List<ItemData>> _f$data = Field(
    'data',
    _$data,
    opt: true,
  );
  static int? _$code(ItemResponse v) => v.code;
  static const Field<ItemResponse, int> _f$code = Field(
    'code',
    _$code,
    opt: true,
  );

  @override
  final MappableFields<ItemResponse> fields = const {
    #error: _f$error,
    #message: _f$message,
    #data: _f$data,
    #code: _f$code,
  };

  static ItemResponse _instantiate(DecodingData data) {
    return ItemResponse(
      error: data.dec(_f$error),
      message: data.dec(_f$message),
      data: data.dec(_f$data),
      code: data.dec(_f$code),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ItemResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ItemResponse>(map);
  }

  static ItemResponse fromJson(String json) {
    return ensureInitialized().decodeJson<ItemResponse>(json);
  }
}

mixin ItemResponseMappable {
  String toJson() {
    return ItemResponseMapper.ensureInitialized().encodeJson<ItemResponse>(
      this as ItemResponse,
    );
  }

  Map<String, dynamic> toMap() {
    return ItemResponseMapper.ensureInitialized().encodeMap<ItemResponse>(
      this as ItemResponse,
    );
  }

  ItemResponseCopyWith<ItemResponse, ItemResponse, ItemResponse> get copyWith =>
      _ItemResponseCopyWithImpl<ItemResponse, ItemResponse>(
        this as ItemResponse,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ItemResponseMapper.ensureInitialized().stringifyValue(
      this as ItemResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return ItemResponseMapper.ensureInitialized().equalsValue(
      this as ItemResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return ItemResponseMapper.ensureInitialized().hashValue(
      this as ItemResponse,
    );
  }
}

extension ItemResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ItemResponse, $Out> {
  ItemResponseCopyWith<$R, ItemResponse, $Out> get $asItemResponse =>
      $base.as((v, t, t2) => _ItemResponseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ItemResponseCopyWith<$R, $In extends ItemResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, ItemData, ItemDataCopyWith<$R, ItemData, ItemData>>?
  get data;
  $R call({bool? error, String? message, List<ItemData>? data, int? code});
  ItemResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ItemResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ItemResponse, $Out>
    implements ItemResponseCopyWith<$R, ItemResponse, $Out> {
  _ItemResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ItemResponse> $mapper =
      ItemResponseMapper.ensureInitialized();
  @override
  ListCopyWith<$R, ItemData, ItemDataCopyWith<$R, ItemData, ItemData>>?
  get data => $value.data != null
      ? ListCopyWith(
          $value.data!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(data: v),
        )
      : null;
  @override
  $R call({
    Object? error = $none,
    Object? message = $none,
    Object? data = $none,
    Object? code = $none,
  }) => $apply(
    FieldCopyWithData({
      if (error != $none) #error: error,
      if (message != $none) #message: message,
      if (data != $none) #data: data,
      if (code != $none) #code: code,
    }),
  );
  @override
  ItemResponse $make(CopyWithData data) => ItemResponse(
    error: data.get(#error, or: $value.error),
    message: data.get(#message, or: $value.message),
    data: data.get(#data, or: $value.data),
    code: data.get(#code, or: $value.code),
  );

  @override
  ItemResponseCopyWith<$R2, ItemResponse, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ItemResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ItemDataMapper extends ClassMapperBase<ItemData> {
  ItemDataMapper._();

  static ItemDataMapper? _instance;
  static ItemDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ItemDataMapper._());
      UserMapper.ensureInitialized();
      CategoryMapper.ensureInitialized();
      TranslatedItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ItemData';

  static int? _$id(ItemData v) => v.id;
  static const Field<ItemData, int> _f$id = Field('id', _$id, opt: true);
  static String? _$name(ItemData v) => v.name;
  static const Field<ItemData, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$slug(ItemData v) => v.slug;
  static const Field<ItemData, String> _f$slug = Field(
    'slug',
    _$slug,
    opt: true,
  );
  static String? _$description(ItemData v) => v.description;
  static const Field<ItemData, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static int? _$price(ItemData v) => v.price;
  static const Field<ItemData, int> _f$price = Field(
    'price',
    _$price,
    opt: true,
  );
  static double? _$latitude(ItemData v) => v.latitude;
  static const Field<ItemData, double> _f$latitude = Field(
    'latitude',
    _$latitude,
    opt: true,
  );
  static double? _$longitude(ItemData v) => v.longitude;
  static const Field<ItemData, double> _f$longitude = Field(
    'longitude',
    _$longitude,
    opt: true,
  );
  static String? _$address(ItemData v) => v.address;
  static const Field<ItemData, String> _f$address = Field(
    'address',
    _$address,
    opt: true,
  );
  static String? _$contact(ItemData v) => v.contact;
  static const Field<ItemData, String> _f$contact = Field(
    'contact',
    _$contact,
    opt: true,
  );
  static int? _$showOnlyToPremium(ItemData v) => v.showOnlyToPremium;
  static const Field<ItemData, int> _f$showOnlyToPremium = Field(
    'showOnlyToPremium',
    _$showOnlyToPremium,
    key: r'show_only_to_premium',
    opt: true,
  );
  static String? _$status(ItemData v) => v.status;
  static const Field<ItemData, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static String? _$videoLink(ItemData v) => v.videoLink;
  static const Field<ItemData, String> _f$videoLink = Field(
    'videoLink',
    _$videoLink,
    key: r'video_link',
    opt: true,
  );
  static String? _$city(ItemData v) => v.city;
  static const Field<ItemData, String> _f$city = Field(
    'city',
    _$city,
    opt: true,
  );
  static String? _$state(ItemData v) => v.state;
  static const Field<ItemData, String> _f$state = Field(
    'state',
    _$state,
    opt: true,
  );
  static String? _$country(ItemData v) => v.country;
  static const Field<ItemData, String> _f$country = Field(
    'country',
    _$country,
    opt: true,
  );
  static int? _$userId(ItemData v) => v.userId;
  static const Field<ItemData, int> _f$userId = Field(
    'userId',
    _$userId,
    key: r'user_id',
    opt: true,
  );
  static int? _$categoryId(ItemData v) => v.categoryId;
  static const Field<ItemData, int> _f$categoryId = Field(
    'categoryId',
    _$categoryId,
    key: r'category_id',
    opt: true,
  );
  static String? _$allCategoryIds(ItemData v) => v.allCategoryIds;
  static const Field<ItemData, String> _f$allCategoryIds = Field(
    'allCategoryIds',
    _$allCategoryIds,
    key: r'all_category_ids',
    opt: true,
  );
  static String? _$expiryDate(ItemData v) => v.expiryDate;
  static const Field<ItemData, String> _f$expiryDate = Field(
    'expiryDate',
    _$expiryDate,
    key: r'expiry_date',
    opt: true,
  );
  static int? _$clicks(ItemData v) => v.clicks;
  static const Field<ItemData, int> _f$clicks = Field(
    'clicks',
    _$clicks,
    opt: true,
  );
  static String? _$createdAt(ItemData v) => v.createdAt;
  static const Field<ItemData, String> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static String? _$updatedAt(ItemData v) => v.updatedAt;
  static const Field<ItemData, String> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
    opt: true,
  );
  static int? _$isEditedByAdmin(ItemData v) => v.isEditedByAdmin;
  static const Field<ItemData, int> _f$isEditedByAdmin = Field(
    'isEditedByAdmin',
    _$isEditedByAdmin,
    key: r'is_edited_by_admin',
    opt: true,
  );
  static int? _$packageId(ItemData v) => v.packageId;
  static const Field<ItemData, int> _f$packageId = Field(
    'packageId',
    _$packageId,
    key: r'package_id',
    opt: true,
  );
  static String? _$translatedName(ItemData v) => v.translatedName;
  static const Field<ItemData, String> _f$translatedName = Field(
    'translatedName',
    _$translatedName,
    key: r'translated_name',
    opt: true,
  );
  static String? _$translatedDescription(ItemData v) => v.translatedDescription;
  static const Field<ItemData, String> _f$translatedDescription = Field(
    'translatedDescription',
    _$translatedDescription,
    key: r'translated_description',
    opt: true,
  );
  static User? _$user(ItemData v) => v.user;
  static const Field<ItemData, User> _f$user = Field('user', _$user, opt: true);
  static Category? _$category(ItemData v) => v.category;
  static const Field<ItemData, Category> _f$category = Field(
    'category',
    _$category,
    opt: true,
  );
  static TranslatedItem? _$translatedItem(ItemData v) => v.translatedItem;
  static const Field<ItemData, TranslatedItem> _f$translatedItem = Field(
    'translatedItem',
    _$translatedItem,
    key: r'translated_item',
    opt: true,
  );
  static List<dynamic>? _$galleryImages(ItemData v) => v.galleryImages;
  static const Field<ItemData, List<dynamic>> _f$galleryImages = Field(
    'galleryImages',
    _$galleryImages,
    key: r'gallery_images',
    opt: true,
  );
  static List<dynamic>? _$featuredItems(ItemData v) => v.featuredItems;
  static const Field<ItemData, List<dynamic>> _f$featuredItems = Field(
    'featuredItems',
    _$featuredItems,
    key: r'featured_items',
    opt: true,
  );
  static List<dynamic>? _$favourites(ItemData v) => v.favourites;
  static const Field<ItemData, List<dynamic>> _f$favourites = Field(
    'favourites',
    _$favourites,
    opt: true,
  );
  static bool? _$isFeature(ItemData v) => v.isFeature;
  static const Field<ItemData, bool> _f$isFeature = Field(
    'isFeature',
    _$isFeature,
    key: r'is_feature',
    opt: true,
  );
  static int? _$totalLikes(ItemData v) => v.totalLikes;
  static const Field<ItemData, int> _f$totalLikes = Field(
    'totalLikes',
    _$totalLikes,
    key: r'total_likes',
    opt: true,
  );
  static bool? _$isLiked(ItemData v) => v.isLiked;
  static const Field<ItemData, bool> _f$isLiked = Field(
    'isLiked',
    _$isLiked,
    key: r'is_liked',
    opt: true,
  );
  static List<dynamic>? _$customFields(ItemData v) => v.customFields;
  static const Field<ItemData, List<dynamic>> _f$customFields = Field(
    'customFields',
    _$customFields,
    key: r'custom_fields',
    opt: true,
  );

  @override
  final MappableFields<ItemData> fields = const {
    #id: _f$id,
    #name: _f$name,
    #slug: _f$slug,
    #description: _f$description,
    #price: _f$price,
    #latitude: _f$latitude,
    #longitude: _f$longitude,
    #address: _f$address,
    #contact: _f$contact,
    #showOnlyToPremium: _f$showOnlyToPremium,
    #status: _f$status,
    #videoLink: _f$videoLink,
    #city: _f$city,
    #state: _f$state,
    #country: _f$country,
    #userId: _f$userId,
    #categoryId: _f$categoryId,
    #allCategoryIds: _f$allCategoryIds,
    #expiryDate: _f$expiryDate,
    #clicks: _f$clicks,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #isEditedByAdmin: _f$isEditedByAdmin,
    #packageId: _f$packageId,
    #translatedName: _f$translatedName,
    #translatedDescription: _f$translatedDescription,
    #user: _f$user,
    #category: _f$category,
    #translatedItem: _f$translatedItem,
    #galleryImages: _f$galleryImages,
    #featuredItems: _f$featuredItems,
    #favourites: _f$favourites,
    #isFeature: _f$isFeature,
    #totalLikes: _f$totalLikes,
    #isLiked: _f$isLiked,
    #customFields: _f$customFields,
  };
  @override
  final bool ignoreNull = true;

  static ItemData _instantiate(DecodingData data) {
    return ItemData(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      slug: data.dec(_f$slug),
      description: data.dec(_f$description),
      price: data.dec(_f$price),
      latitude: data.dec(_f$latitude),
      longitude: data.dec(_f$longitude),
      address: data.dec(_f$address),
      contact: data.dec(_f$contact),
      showOnlyToPremium: data.dec(_f$showOnlyToPremium),
      status: data.dec(_f$status),
      videoLink: data.dec(_f$videoLink),
      city: data.dec(_f$city),
      state: data.dec(_f$state),
      country: data.dec(_f$country),
      userId: data.dec(_f$userId),
      categoryId: data.dec(_f$categoryId),
      allCategoryIds: data.dec(_f$allCategoryIds),
      expiryDate: data.dec(_f$expiryDate),
      clicks: data.dec(_f$clicks),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      isEditedByAdmin: data.dec(_f$isEditedByAdmin),
      packageId: data.dec(_f$packageId),
      translatedName: data.dec(_f$translatedName),
      translatedDescription: data.dec(_f$translatedDescription),
      user: data.dec(_f$user),
      category: data.dec(_f$category),
      translatedItem: data.dec(_f$translatedItem),
      galleryImages: data.dec(_f$galleryImages),
      featuredItems: data.dec(_f$featuredItems),
      favourites: data.dec(_f$favourites),
      isFeature: data.dec(_f$isFeature),
      totalLikes: data.dec(_f$totalLikes),
      isLiked: data.dec(_f$isLiked),
      customFields: data.dec(_f$customFields),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ItemData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ItemData>(map);
  }

  static ItemData fromJson(String json) {
    return ensureInitialized().decodeJson<ItemData>(json);
  }
}

mixin ItemDataMappable {
  String toJson() {
    return ItemDataMapper.ensureInitialized().encodeJson<ItemData>(
      this as ItemData,
    );
  }

  Map<String, dynamic> toMap() {
    return ItemDataMapper.ensureInitialized().encodeMap<ItemData>(
      this as ItemData,
    );
  }

  ItemDataCopyWith<ItemData, ItemData, ItemData> get copyWith =>
      _ItemDataCopyWithImpl<ItemData, ItemData>(
        this as ItemData,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ItemDataMapper.ensureInitialized().stringifyValue(this as ItemData);
  }

  @override
  bool operator ==(Object other) {
    return ItemDataMapper.ensureInitialized().equalsValue(
      this as ItemData,
      other,
    );
  }

  @override
  int get hashCode {
    return ItemDataMapper.ensureInitialized().hashValue(this as ItemData);
  }
}

extension ItemDataValueCopy<$R, $Out> on ObjectCopyWith<$R, ItemData, $Out> {
  ItemDataCopyWith<$R, ItemData, $Out> get $asItemData =>
      $base.as((v, t, t2) => _ItemDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ItemDataCopyWith<$R, $In extends ItemData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserCopyWith<$R, User, User>? get user;
  CategoryCopyWith<$R, Category, Category>? get category;
  TranslatedItemCopyWith<$R, TranslatedItem, TranslatedItem>?
  get translatedItem;
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get galleryImages;
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get featuredItems;
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get favourites;
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get customFields;
  $R call({
    int? id,
    String? name,
    String? slug,
    String? description,
    int? price,
    double? latitude,
    double? longitude,
    String? address,
    String? contact,
    int? showOnlyToPremium,
    String? status,
    String? videoLink,
    String? city,
    String? state,
    String? country,
    int? userId,
    int? categoryId,
    String? allCategoryIds,
    String? expiryDate,
    int? clicks,
    String? createdAt,
    String? updatedAt,
    int? isEditedByAdmin,
    int? packageId,
    String? translatedName,
    String? translatedDescription,
    User? user,
    Category? category,
    TranslatedItem? translatedItem,
    List<dynamic>? galleryImages,
    List<dynamic>? featuredItems,
    List<dynamic>? favourites,
    bool? isFeature,
    int? totalLikes,
    bool? isLiked,
    List<dynamic>? customFields,
  });
  ItemDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ItemDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ItemData, $Out>
    implements ItemDataCopyWith<$R, ItemData, $Out> {
  _ItemDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ItemData> $mapper =
      ItemDataMapper.ensureInitialized();
  @override
  UserCopyWith<$R, User, User>? get user =>
      $value.user?.copyWith.$chain((v) => call(user: v));
  @override
  CategoryCopyWith<$R, Category, Category>? get category =>
      $value.category?.copyWith.$chain((v) => call(category: v));
  @override
  TranslatedItemCopyWith<$R, TranslatedItem, TranslatedItem>?
  get translatedItem =>
      $value.translatedItem?.copyWith.$chain((v) => call(translatedItem: v));
  @override
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get galleryImages => $value.galleryImages != null
      ? ListCopyWith(
          $value.galleryImages!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(galleryImages: v),
        )
      : null;
  @override
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get featuredItems => $value.featuredItems != null
      ? ListCopyWith(
          $value.featuredItems!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(featuredItems: v),
        )
      : null;
  @override
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get favourites => $value.favourites != null
      ? ListCopyWith(
          $value.favourites!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(favourites: v),
        )
      : null;
  @override
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get customFields => $value.customFields != null
      ? ListCopyWith(
          $value.customFields!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(customFields: v),
        )
      : null;
  @override
  $R call({
    Object? id = $none,
    Object? name = $none,
    Object? slug = $none,
    Object? description = $none,
    Object? price = $none,
    Object? latitude = $none,
    Object? longitude = $none,
    Object? address = $none,
    Object? contact = $none,
    Object? showOnlyToPremium = $none,
    Object? status = $none,
    Object? videoLink = $none,
    Object? city = $none,
    Object? state = $none,
    Object? country = $none,
    Object? userId = $none,
    Object? categoryId = $none,
    Object? allCategoryIds = $none,
    Object? expiryDate = $none,
    Object? clicks = $none,
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? isEditedByAdmin = $none,
    Object? packageId = $none,
    Object? translatedName = $none,
    Object? translatedDescription = $none,
    Object? user = $none,
    Object? category = $none,
    Object? translatedItem = $none,
    Object? galleryImages = $none,
    Object? featuredItems = $none,
    Object? favourites = $none,
    Object? isFeature = $none,
    Object? totalLikes = $none,
    Object? isLiked = $none,
    Object? customFields = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (name != $none) #name: name,
      if (slug != $none) #slug: slug,
      if (description != $none) #description: description,
      if (price != $none) #price: price,
      if (latitude != $none) #latitude: latitude,
      if (longitude != $none) #longitude: longitude,
      if (address != $none) #address: address,
      if (contact != $none) #contact: contact,
      if (showOnlyToPremium != $none) #showOnlyToPremium: showOnlyToPremium,
      if (status != $none) #status: status,
      if (videoLink != $none) #videoLink: videoLink,
      if (city != $none) #city: city,
      if (state != $none) #state: state,
      if (country != $none) #country: country,
      if (userId != $none) #userId: userId,
      if (categoryId != $none) #categoryId: categoryId,
      if (allCategoryIds != $none) #allCategoryIds: allCategoryIds,
      if (expiryDate != $none) #expiryDate: expiryDate,
      if (clicks != $none) #clicks: clicks,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (isEditedByAdmin != $none) #isEditedByAdmin: isEditedByAdmin,
      if (packageId != $none) #packageId: packageId,
      if (translatedName != $none) #translatedName: translatedName,
      if (translatedDescription != $none)
        #translatedDescription: translatedDescription,
      if (user != $none) #user: user,
      if (category != $none) #category: category,
      if (translatedItem != $none) #translatedItem: translatedItem,
      if (galleryImages != $none) #galleryImages: galleryImages,
      if (featuredItems != $none) #featuredItems: featuredItems,
      if (favourites != $none) #favourites: favourites,
      if (isFeature != $none) #isFeature: isFeature,
      if (totalLikes != $none) #totalLikes: totalLikes,
      if (isLiked != $none) #isLiked: isLiked,
      if (customFields != $none) #customFields: customFields,
    }),
  );
  @override
  ItemData $make(CopyWithData data) => ItemData(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    slug: data.get(#slug, or: $value.slug),
    description: data.get(#description, or: $value.description),
    price: data.get(#price, or: $value.price),
    latitude: data.get(#latitude, or: $value.latitude),
    longitude: data.get(#longitude, or: $value.longitude),
    address: data.get(#address, or: $value.address),
    contact: data.get(#contact, or: $value.contact),
    showOnlyToPremium: data.get(
      #showOnlyToPremium,
      or: $value.showOnlyToPremium,
    ),
    status: data.get(#status, or: $value.status),
    videoLink: data.get(#videoLink, or: $value.videoLink),
    city: data.get(#city, or: $value.city),
    state: data.get(#state, or: $value.state),
    country: data.get(#country, or: $value.country),
    userId: data.get(#userId, or: $value.userId),
    categoryId: data.get(#categoryId, or: $value.categoryId),
    allCategoryIds: data.get(#allCategoryIds, or: $value.allCategoryIds),
    expiryDate: data.get(#expiryDate, or: $value.expiryDate),
    clicks: data.get(#clicks, or: $value.clicks),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    isEditedByAdmin: data.get(#isEditedByAdmin, or: $value.isEditedByAdmin),
    packageId: data.get(#packageId, or: $value.packageId),
    translatedName: data.get(#translatedName, or: $value.translatedName),
    translatedDescription: data.get(
      #translatedDescription,
      or: $value.translatedDescription,
    ),
    user: data.get(#user, or: $value.user),
    category: data.get(#category, or: $value.category),
    translatedItem: data.get(#translatedItem, or: $value.translatedItem),
    galleryImages: data.get(#galleryImages, or: $value.galleryImages),
    featuredItems: data.get(#featuredItems, or: $value.featuredItems),
    favourites: data.get(#favourites, or: $value.favourites),
    isFeature: data.get(#isFeature, or: $value.isFeature),
    totalLikes: data.get(#totalLikes, or: $value.totalLikes),
    isLiked: data.get(#isLiked, or: $value.isLiked),
    customFields: data.get(#customFields, or: $value.customFields),
  );

  @override
  ItemDataCopyWith<$R2, ItemData, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ItemDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UserMapper extends ClassMapperBase<User> {
  UserMapper._();

  static UserMapper? _instance;
  static UserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'User';

  static int? _$id(User v) => v.id;
  static const Field<User, int> _f$id = Field('id', _$id, opt: true);
  static String? _$name(User v) => v.name;
  static const Field<User, String> _f$name = Field('name', _$name, opt: true);
  static String? _$email(User v) => v.email;
  static const Field<User, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
  );
  static String? _$mobile(User v) => v.mobile;
  static const Field<User, String> _f$mobile = Field(
    'mobile',
    _$mobile,
    opt: true,
  );
  static String? _$profile(User v) => v.profile;
  static const Field<User, String> _f$profile = Field(
    'profile',
    _$profile,
    opt: true,
  );
  static String? _$countryCode(User v) => v.countryCode;
  static const Field<User, String> _f$countryCode = Field(
    'countryCode',
    _$countryCode,
    key: r'country_code',
    opt: true,
  );
  static int? _$reviewsCount(User v) => v.reviewsCount;
  static const Field<User, int> _f$reviewsCount = Field(
    'reviewsCount',
    _$reviewsCount,
    key: r'reviews_count',
    opt: true,
  );
  static double? _$averageRating(User v) => v.averageRating;
  static const Field<User, double> _f$averageRating = Field(
    'averageRating',
    _$averageRating,
    key: r'average_rating',
    opt: true,
  );
  static List<dynamic>? _$sellerReview(User v) => v.sellerReview;
  static const Field<User, List<dynamic>> _f$sellerReview = Field(
    'sellerReview',
    _$sellerReview,
    key: r'seller_review',
    opt: true,
  );

  @override
  final MappableFields<User> fields = const {
    #id: _f$id,
    #name: _f$name,
    #email: _f$email,
    #mobile: _f$mobile,
    #profile: _f$profile,
    #countryCode: _f$countryCode,
    #reviewsCount: _f$reviewsCount,
    #averageRating: _f$averageRating,
    #sellerReview: _f$sellerReview,
  };
  @override
  final bool ignoreNull = true;

  static User _instantiate(DecodingData data) {
    return User(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      email: data.dec(_f$email),
      mobile: data.dec(_f$mobile),
      profile: data.dec(_f$profile),
      countryCode: data.dec(_f$countryCode),
      reviewsCount: data.dec(_f$reviewsCount),
      averageRating: data.dec(_f$averageRating),
      sellerReview: data.dec(_f$sellerReview),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static User fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<User>(map);
  }

  static User fromJson(String json) {
    return ensureInitialized().decodeJson<User>(json);
  }
}

mixin UserMappable {
  String toJson() {
    return UserMapper.ensureInitialized().encodeJson<User>(this as User);
  }

  Map<String, dynamic> toMap() {
    return UserMapper.ensureInitialized().encodeMap<User>(this as User);
  }

  UserCopyWith<User, User, User> get copyWith =>
      _UserCopyWithImpl<User, User>(this as User, $identity, $identity);
  @override
  String toString() {
    return UserMapper.ensureInitialized().stringifyValue(this as User);
  }

  @override
  bool operator ==(Object other) {
    return UserMapper.ensureInitialized().equalsValue(this as User, other);
  }

  @override
  int get hashCode {
    return UserMapper.ensureInitialized().hashValue(this as User);
  }
}

extension UserValueCopy<$R, $Out> on ObjectCopyWith<$R, User, $Out> {
  UserCopyWith<$R, User, $Out> get $asUser =>
      $base.as((v, t, t2) => _UserCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserCopyWith<$R, $In extends User, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get sellerReview;
  $R call({
    int? id,
    String? name,
    String? email,
    String? mobile,
    String? profile,
    String? countryCode,
    int? reviewsCount,
    double? averageRating,
    List<dynamic>? sellerReview,
  });
  UserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, User, $Out>
    implements UserCopyWith<$R, User, $Out> {
  _UserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<User> $mapper = UserMapper.ensureInitialized();
  @override
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get sellerReview => $value.sellerReview != null
      ? ListCopyWith(
          $value.sellerReview!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(sellerReview: v),
        )
      : null;
  @override
  $R call({
    Object? id = $none,
    Object? name = $none,
    Object? email = $none,
    Object? mobile = $none,
    Object? profile = $none,
    Object? countryCode = $none,
    Object? reviewsCount = $none,
    Object? averageRating = $none,
    Object? sellerReview = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (name != $none) #name: name,
      if (email != $none) #email: email,
      if (mobile != $none) #mobile: mobile,
      if (profile != $none) #profile: profile,
      if (countryCode != $none) #countryCode: countryCode,
      if (reviewsCount != $none) #reviewsCount: reviewsCount,
      if (averageRating != $none) #averageRating: averageRating,
      if (sellerReview != $none) #sellerReview: sellerReview,
    }),
  );
  @override
  User $make(CopyWithData data) => User(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    email: data.get(#email, or: $value.email),
    mobile: data.get(#mobile, or: $value.mobile),
    profile: data.get(#profile, or: $value.profile),
    countryCode: data.get(#countryCode, or: $value.countryCode),
    reviewsCount: data.get(#reviewsCount, or: $value.reviewsCount),
    averageRating: data.get(#averageRating, or: $value.averageRating),
    sellerReview: data.get(#sellerReview, or: $value.sellerReview),
  );

  @override
  UserCopyWith<$R2, User, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CategoryMapper extends ClassMapperBase<Category> {
  CategoryMapper._();

  static CategoryMapper? _instance;
  static CategoryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoryMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Category';

  static int? _$id(Category v) => v.id;
  static const Field<Category, int> _f$id = Field('id', _$id, opt: true);
  static String? _$name(Category v) => v.name;
  static const Field<Category, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$image(Category v) => v.image;
  static const Field<Category, String> _f$image = Field(
    'image',
    _$image,
    opt: true,
  );
  static int? _$isJobCategory(Category v) => v.isJobCategory;
  static const Field<Category, int> _f$isJobCategory = Field(
    'isJobCategory',
    _$isJobCategory,
    key: r'is_job_category',
    opt: true,
  );
  static int? _$priceOptional(Category v) => v.priceOptional;
  static const Field<Category, int> _f$priceOptional = Field(
    'priceOptional',
    _$priceOptional,
    key: r'price_optional',
    opt: true,
  );
  static String? _$translatedName(Category v) => v.translatedName;
  static const Field<Category, String> _f$translatedName = Field(
    'translatedName',
    _$translatedName,
    key: r'translated_name',
    opt: true,
  );
  static String? _$translatedDescription(Category v) => v.translatedDescription;
  static const Field<Category, String> _f$translatedDescription = Field(
    'translatedDescription',
    _$translatedDescription,
    key: r'translated_description',
    opt: true,
  );
  static List<dynamic>? _$translations(Category v) => v.translations;
  static const Field<Category, List<dynamic>> _f$translations = Field(
    'translations',
    _$translations,
    opt: true,
  );

  @override
  final MappableFields<Category> fields = const {
    #id: _f$id,
    #name: _f$name,
    #image: _f$image,
    #isJobCategory: _f$isJobCategory,
    #priceOptional: _f$priceOptional,
    #translatedName: _f$translatedName,
    #translatedDescription: _f$translatedDescription,
    #translations: _f$translations,
  };
  @override
  final bool ignoreNull = true;

  static Category _instantiate(DecodingData data) {
    return Category(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      image: data.dec(_f$image),
      isJobCategory: data.dec(_f$isJobCategory),
      priceOptional: data.dec(_f$priceOptional),
      translatedName: data.dec(_f$translatedName),
      translatedDescription: data.dec(_f$translatedDescription),
      translations: data.dec(_f$translations),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Category fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Category>(map);
  }

  static Category fromJson(String json) {
    return ensureInitialized().decodeJson<Category>(json);
  }
}

mixin CategoryMappable {
  String toJson() {
    return CategoryMapper.ensureInitialized().encodeJson<Category>(
      this as Category,
    );
  }

  Map<String, dynamic> toMap() {
    return CategoryMapper.ensureInitialized().encodeMap<Category>(
      this as Category,
    );
  }

  CategoryCopyWith<Category, Category, Category> get copyWith =>
      _CategoryCopyWithImpl<Category, Category>(
        this as Category,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CategoryMapper.ensureInitialized().stringifyValue(this as Category);
  }

  @override
  bool operator ==(Object other) {
    return CategoryMapper.ensureInitialized().equalsValue(
      this as Category,
      other,
    );
  }

  @override
  int get hashCode {
    return CategoryMapper.ensureInitialized().hashValue(this as Category);
  }
}

extension CategoryValueCopy<$R, $Out> on ObjectCopyWith<$R, Category, $Out> {
  CategoryCopyWith<$R, Category, $Out> get $asCategory =>
      $base.as((v, t, t2) => _CategoryCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CategoryCopyWith<$R, $In extends Category, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get translations;
  $R call({
    int? id,
    String? name,
    String? image,
    int? isJobCategory,
    int? priceOptional,
    String? translatedName,
    String? translatedDescription,
    List<dynamic>? translations,
  });
  CategoryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CategoryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Category, $Out>
    implements CategoryCopyWith<$R, Category, $Out> {
  _CategoryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Category> $mapper =
      CategoryMapper.ensureInitialized();
  @override
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get translations => $value.translations != null
      ? ListCopyWith(
          $value.translations!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(translations: v),
        )
      : null;
  @override
  $R call({
    Object? id = $none,
    Object? name = $none,
    Object? image = $none,
    Object? isJobCategory = $none,
    Object? priceOptional = $none,
    Object? translatedName = $none,
    Object? translatedDescription = $none,
    Object? translations = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (name != $none) #name: name,
      if (image != $none) #image: image,
      if (isJobCategory != $none) #isJobCategory: isJobCategory,
      if (priceOptional != $none) #priceOptional: priceOptional,
      if (translatedName != $none) #translatedName: translatedName,
      if (translatedDescription != $none)
        #translatedDescription: translatedDescription,
      if (translations != $none) #translations: translations,
    }),
  );
  @override
  Category $make(CopyWithData data) => Category(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    image: data.get(#image, or: $value.image),
    isJobCategory: data.get(#isJobCategory, or: $value.isJobCategory),
    priceOptional: data.get(#priceOptional, or: $value.priceOptional),
    translatedName: data.get(#translatedName, or: $value.translatedName),
    translatedDescription: data.get(
      #translatedDescription,
      or: $value.translatedDescription,
    ),
    translations: data.get(#translations, or: $value.translations),
  );

  @override
  CategoryCopyWith<$R2, Category, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CategoryCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class TranslatedItemMapper extends ClassMapperBase<TranslatedItem> {
  TranslatedItemMapper._();

  static TranslatedItemMapper? _instance;
  static TranslatedItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TranslatedItemMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TranslatedItem';

  static String? _$name(TranslatedItem v) => v.name;
  static const Field<TranslatedItem, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$description(TranslatedItem v) => v.description;
  static const Field<TranslatedItem, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static String? _$address(TranslatedItem v) => v.address;
  static const Field<TranslatedItem, String> _f$address = Field(
    'address',
    _$address,
    opt: true,
  );
  static String? _$city(TranslatedItem v) => v.city;
  static const Field<TranslatedItem, String> _f$city = Field(
    'city',
    _$city,
    opt: true,
  );
  static String? _$state(TranslatedItem v) => v.state;
  static const Field<TranslatedItem, String> _f$state = Field(
    'state',
    _$state,
    opt: true,
  );
  static String? _$country(TranslatedItem v) => v.country;
  static const Field<TranslatedItem, String> _f$country = Field(
    'country',
    _$country,
    opt: true,
  );
  static String? _$rejectedReason(TranslatedItem v) => v.rejectedReason;
  static const Field<TranslatedItem, String> _f$rejectedReason = Field(
    'rejectedReason',
    _$rejectedReason,
    key: r'rejected_reason',
    opt: true,
  );
  static String? _$adminEditReason(TranslatedItem v) => v.adminEditReason;
  static const Field<TranslatedItem, String> _f$adminEditReason = Field(
    'adminEditReason',
    _$adminEditReason,
    key: r'admin_edit_reason',
    opt: true,
  );

  @override
  final MappableFields<TranslatedItem> fields = const {
    #name: _f$name,
    #description: _f$description,
    #address: _f$address,
    #city: _f$city,
    #state: _f$state,
    #country: _f$country,
    #rejectedReason: _f$rejectedReason,
    #adminEditReason: _f$adminEditReason,
  };
  @override
  final bool ignoreNull = true;

  static TranslatedItem _instantiate(DecodingData data) {
    return TranslatedItem(
      name: data.dec(_f$name),
      description: data.dec(_f$description),
      address: data.dec(_f$address),
      city: data.dec(_f$city),
      state: data.dec(_f$state),
      country: data.dec(_f$country),
      rejectedReason: data.dec(_f$rejectedReason),
      adminEditReason: data.dec(_f$adminEditReason),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TranslatedItem fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TranslatedItem>(map);
  }

  static TranslatedItem fromJson(String json) {
    return ensureInitialized().decodeJson<TranslatedItem>(json);
  }
}

mixin TranslatedItemMappable {
  String toJson() {
    return TranslatedItemMapper.ensureInitialized().encodeJson<TranslatedItem>(
      this as TranslatedItem,
    );
  }

  Map<String, dynamic> toMap() {
    return TranslatedItemMapper.ensureInitialized().encodeMap<TranslatedItem>(
      this as TranslatedItem,
    );
  }

  TranslatedItemCopyWith<TranslatedItem, TranslatedItem, TranslatedItem>
  get copyWith => _TranslatedItemCopyWithImpl<TranslatedItem, TranslatedItem>(
    this as TranslatedItem,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return TranslatedItemMapper.ensureInitialized().stringifyValue(
      this as TranslatedItem,
    );
  }

  @override
  bool operator ==(Object other) {
    return TranslatedItemMapper.ensureInitialized().equalsValue(
      this as TranslatedItem,
      other,
    );
  }

  @override
  int get hashCode {
    return TranslatedItemMapper.ensureInitialized().hashValue(
      this as TranslatedItem,
    );
  }
}

extension TranslatedItemValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TranslatedItem, $Out> {
  TranslatedItemCopyWith<$R, TranslatedItem, $Out> get $asTranslatedItem =>
      $base.as((v, t, t2) => _TranslatedItemCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TranslatedItemCopyWith<$R, $In extends TranslatedItem, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? name,
    String? description,
    String? address,
    String? city,
    String? state,
    String? country,
    String? rejectedReason,
    String? adminEditReason,
  });
  TranslatedItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TranslatedItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TranslatedItem, $Out>
    implements TranslatedItemCopyWith<$R, TranslatedItem, $Out> {
  _TranslatedItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TranslatedItem> $mapper =
      TranslatedItemMapper.ensureInitialized();
  @override
  $R call({
    Object? name = $none,
    Object? description = $none,
    Object? address = $none,
    Object? city = $none,
    Object? state = $none,
    Object? country = $none,
    Object? rejectedReason = $none,
    Object? adminEditReason = $none,
  }) => $apply(
    FieldCopyWithData({
      if (name != $none) #name: name,
      if (description != $none) #description: description,
      if (address != $none) #address: address,
      if (city != $none) #city: city,
      if (state != $none) #state: state,
      if (country != $none) #country: country,
      if (rejectedReason != $none) #rejectedReason: rejectedReason,
      if (adminEditReason != $none) #adminEditReason: adminEditReason,
    }),
  );
  @override
  TranslatedItem $make(CopyWithData data) => TranslatedItem(
    name: data.get(#name, or: $value.name),
    description: data.get(#description, or: $value.description),
    address: data.get(#address, or: $value.address),
    city: data.get(#city, or: $value.city),
    state: data.get(#state, or: $value.state),
    country: data.get(#country, or: $value.country),
    rejectedReason: data.get(#rejectedReason, or: $value.rejectedReason),
    adminEditReason: data.get(#adminEditReason, or: $value.adminEditReason),
  );

  @override
  TranslatedItemCopyWith<$R2, TranslatedItem, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TranslatedItemCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

