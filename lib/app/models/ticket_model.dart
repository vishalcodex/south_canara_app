class Ticket {
  int? id;
  String? topic;
  String? query;
  String? priority;
  int? vendorId;
  String? createdAt;
  String? updatedAt;
  String? status;

  Ticket(
      {this.id,
      this.topic,
      this.query,
      this.priority,
      this.vendorId,
      this.createdAt,
      this.updatedAt});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    topic = json['topic'];
    query = json['query'];
    priority = json['priority'];
    vendorId = json['vendor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = "COMPLETED";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['topic'] = this.topic;
    data['query'] = this.query;
    data['priority'] = this.priority;
    data['vendor_id'] = this.vendorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
