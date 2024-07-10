import 'product_model.dart';
import 'vendor.dart';

class ContactedSeller {
  int? id;
  String? enquiry;
  int? userId;
  int? vendorId;
  int? productId;
  String? quantity;
  String? location;
  String? createdAt;
  String? updatedAt;
  Vendor? vendor;
  Product? product;

  ContactedSeller(
      {this.id,
      this.enquiry,
      this.userId,
      this.vendorId,
      this.productId,
      this.quantity,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.vendor});

  ContactedSeller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enquiry = json['enquiry'];
    userId = json['user_id'];
    vendorId = json['vendor_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    vendor =
        json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['enquiry'] = this.enquiry;
    data['user_id'] = this.userId;
    data['vendor_id'] = this.vendorId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['location'] = this.location;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}
