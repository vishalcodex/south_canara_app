import 'product_model.dart';
import 'vendor.dart';

class Enquiry {
  int? id;
  String? enquiry;
  int? userId;
  int? vendorId;
  int? productId;
  String? quantity;
  String? location;
  String? createdAt;
  String? updatedAt;
  User? user;
  Product? product;

  Enquiry(
      {this.id,
      this.enquiry,
      this.userId,
      this.vendorId,
      this.productId,
      this.quantity,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.product});

  Enquiry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enquiry = json['enquiry'];
    userId = json['user_id'];
    vendorId = json['vendor_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['enquiry'] = enquiry;
    data['user_id'] = userId;
    data['vendor_id'] = vendorId;
    data['product_id'] = productId;
    data['quantity'] = quantity;
    data['location'] = location;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? location;
  String? createdAt;
  String? updatedAt;
  Vendor? buyer;

  User(
      {this.id,
      this.name,
      this.email,
      this.phoneNumber,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.buyer});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    buyer = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['location'] = location;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (buyer != null) {
      data['vendor'] = buyer!.toJson();
    }
    return data;
  }
}
