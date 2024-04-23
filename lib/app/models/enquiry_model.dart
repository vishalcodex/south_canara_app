class Enquiry {
  int? id;
  String? enquiry;
  int? userId;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;

  Enquiry(
      {this.id,
      this.enquiry,
      this.userId,
      this.phoneNumber,
      this.createdAt,
      this.updatedAt});

  Enquiry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enquiry = json['enquiry'];
    userId = json['user_id'];
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['enquiry'] = this.enquiry;
    data['user_id'] = this.userId;
    data['phone_number'] = this.phoneNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
