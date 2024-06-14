class Notify {
  int? id;
  String? notificationTitle;
  String? notificationDescription;
  String? notificationImg;
  String? createdAt;
  String? updatedAt;

  Notify(
      {this.id,
      this.notificationTitle,
      this.notificationDescription,
      this.notificationImg,
      this.createdAt,
      this.updatedAt});

  Notify.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationTitle = json['notification_title'];
    notificationDescription = json['notification_description'];
    notificationImg = json['notification_img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['notification_title'] = this.notificationTitle;
    data['notification_description'] = this.notificationDescription;
    data['notification_img'] = this.notificationImg;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
