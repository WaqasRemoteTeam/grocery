import 'media.dart';
import 'media.dart';
import 'media.dart';
import 'media.dart';
import 'media.dart';
import 'media.dart';

class ProductCategory {
  ProductCategory({
    this.success,
    this.data,
  });

  bool success;
  List<Datum> data;

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<Datum>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.price,
    this.discountPrice,
    this.description,
    this.capacity,
    this.packageItemsCount,
    this.unit,
    this.featured,
    this.deliverable,
    this.marketId,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.customFields,
    this.hasMedia,
    this.market,
    this.productSubscription,
    this.productSlot,
    this.media,
  });

  int id;
  String name;
  double price;
  int discountPrice;
  String description;
  double capacity;
  int packageItemsCount;
  String unit;
  bool featured;
  bool deliverable;
  int marketId;
  int categoryId;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> customFields;
  bool hasMedia;
  Market market;
  List<dynamic> productSubscription;
  List<ProductSlot> productSlot;
  List<Media> media;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    price: json["price"].toDouble(),
    discountPrice: json["discount_price"],
    description: json["description "],
    capacity: json["capacity "].toDouble(),
    packageItemsCount: json["package_items_count"],
    unit: json["unit"],
    featured: json["featured"],
    deliverable: json["deliverable"],
    marketId: json["market_id"],
    categoryId: json["category_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
    hasMedia: json["has_media"],
    market: Market.fromJson(json["market"]),
    productSubscription: List<dynamic>.from(json["product_subscription"].map((x) => x)),
    productSlot: List<ProductSlot>.from(json["product_slot"].map((x) => x)),
    media: List<Media>.from(json["media"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "discount_price": discountPrice,
    "description ": description,
    "capacity ": capacity,
    "package_items_count": packageItemsCount,
    "unit": unit,
    "featured": featured,
    "deliverable": deliverable,
    "market_id": marketId,
    "category_id": categoryId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "custom_fields": List<dynamic>.from(customFields.map((x) => x)),
    "has_media": hasMedia,
    "market": market.toJson(),
    "product_subscription": List<dynamic>.from(productSubscription.map((x) => x)),
    "product_slot": List<ProductSlot>.from(productSlot.map((x) => x)),
    "media": List<Media>.from(media.map((x) => x)),
  };
}
class ProductSlot {
  ProductSlot({
    this.id,
    this.productId,
    this.slots,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String productId;
  String slots;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProductSlot.fromJson(Map<String, dynamic> json) => ProductSlot(
    id: json["id"],
    productId: json["product_id"],
    slots: json["slots"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "slots": slots,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Market {
  Market({
    this.id,
    this.name,
    this.deliveryFee,
    this.address,
    this.phone,
    this.defaultTax,
    this.customFields,
    this.hasMedia,
    this.rate,
    this.media,
  });

  int id;
  String name;
  double deliveryFee;
  String address;
  String phone;
  double defaultTax;
  List<dynamic> customFields;
  bool hasMedia;
  String rate;
  List<Media> media;

  factory Market.fromJson(Map<String, dynamic> json) => Market(
    id: json["id"],
    name: json["name"],
    deliveryFee: json["delivery_fee"].toDouble(),
    address: json["address"],
    phone: json["phone"],
    defaultTax: json["default_tax"].toDouble(),
    customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
    hasMedia: json["has_media"],
    rate: json["rate"],
    media: List<Media>.from(json["media"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "delivery_fee": deliveryFee,
    "address": address,
    "phone": phone,
    "default_tax": defaultTax,
    "custom_fields": List<dynamic>.from(customFields.map((x) => x)),
    "has_media": hasMedia,
    "rate": rate,
    "media": List<Media>.from(media.map((x) => x)),
  };
}