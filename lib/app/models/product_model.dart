class Product {
  int? id;
  String? productName;
  String? productImage;
  int? categoryId;
  int? subcategoryId;
  String? productDescription;
  String? productUnit;
  String? productPrice;
  int? productMoq;
  String? productOrigin;
  String? packagingType;
  int? vendorId;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
      this.productName,
      this.productImage,
      this.categoryId,
      this.subcategoryId,
      this.productDescription,
      this.productUnit,
      this.productPrice,
      this.productMoq,
      this.productOrigin,
      this.packagingType,
      this.vendorId,
      this.status,
      this.createdAt,
      this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    productDescription = json['product_description'];
    productUnit = json['product_unit'];
    productPrice = json['product_price'];
    productMoq = json['product_moq'];
    productOrigin = json['product_origin'];
    packagingType = json['packaging_type'];
    vendorId = json['vendor_id'];
    status = json['status'] == 1;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['product_description'] = this.productDescription;
    data['product_unit'] = this.productUnit;
    data['product_price'] = this.productPrice;
    data['product_moq'] = this.productMoq;
    data['product_origin'] = this.productOrigin;
    data['packaging_type'] = this.packagingType;
    data['vendor_id'] = this.vendorId;
    data['status'] = (status ?? true) ? 1 : 0;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
