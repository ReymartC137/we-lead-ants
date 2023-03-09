class CollectionsModel {
  int? tableId;
  String? name;
  String? routeName;
  String? cmsName;
  String? tableCode;
  String? websiteCode;
  String? createdAt;
  String? updatedAt;

  CollectionsModel(
      {this.tableId,
      this.name,
      this.routeName,
      this.cmsName,
      this.tableCode,
      this.websiteCode,
      this.createdAt,
      this.updatedAt});

  CollectionsModel.fromJson(Map<String, dynamic> json) {
    tableId = json['table_id'];
    name = json['name'];
    routeName = json['route_name'];
    cmsName = json['cms_name'];
    tableCode = json['table_code'];
    websiteCode = json['website_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['table_id'] = this.tableId;
    data['name'] = this.name;
    data['route_name'] = this.routeName;
    data['cms_name'] = this.cmsName;
    data['table_code'] = this.tableCode;
    data['website_code'] = this.websiteCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
