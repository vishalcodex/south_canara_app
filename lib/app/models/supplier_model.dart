import 'vendor.dart';

class Supplier {
  int? id;
  String? productName;
  String? productImage;
  String? productDescription;
  String? productUnit;
  String? productPrice;
  int? productMoq;
  String? productOrigin;
  String? packagingType;
  int? categoryId;
  String? categoryName;
  int? subcategoryId;
  String? subcategoryName;
  int? vendorId;
  Vendor? vendorDetails;

  Supplier(
      {this.id,
      this.productName,
      this.productImage,
      this.productDescription,
      this.productUnit,
      this.productPrice,
      this.productMoq,
      this.productOrigin,
      this.packagingType,
      this.categoryId,
      this.categoryName,
      this.subcategoryId,
      this.subcategoryName,
      this.vendorId,
      this.vendorDetails});

  Supplier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    productDescription = json['product_description'];
    productUnit = json['product_unit'];
    productPrice = json['product_price'];
    productMoq = json['product_moq'];
    productOrigin = json['product_origin'];
    packagingType = json['packaging_type'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    subcategoryId = json['subcategory_id'];
    subcategoryName = json['subcategory_name'];
    vendorId = json['vendor_id'];
    vendorDetails = json['vendor_details'] != null
        ? new Vendor.fromJson(json['vendor_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['product_description'] = this.productDescription;
    data['product_unit'] = this.productUnit;
    data['product_price'] = this.productPrice;
    data['product_moq'] = this.productMoq;
    data['product_origin'] = this.productOrigin;
    data['packaging_type'] = this.packagingType;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['subcategory_id'] = this.subcategoryId;
    data['subcategory_name'] = this.subcategoryName;
    data['vendor_id'] = this.vendorId;
    if (this.vendorDetails != null) {
      data['vendor_details'] = this.vendorDetails!.toJson();
    }
    return data;
  }
}
