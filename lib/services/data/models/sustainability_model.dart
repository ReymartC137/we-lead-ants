class SustainabilityModel {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? body;
  String? image;

  SustainabilityModel(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.title,
      this.body,
      this.image});

  SustainabilityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    body = json['body'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['title'] = this.title;
    data['body'] = this.body;
    data['image'] = this.image;
    return data;
  }
}
