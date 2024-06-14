class VendorTab {
  String? label;
  int? total;
  String? status;

  VendorTab({this.label, this.total, this.status});

  VendorTab.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    total = json['total'] == "" ? 0 : json["total"];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['total'] = this.total;
    data['status'] = this.status;
    return data;
  }
}
