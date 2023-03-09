class NewsArticleModel {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? newsTitle;
  String? newsBody;
  String? image;
  String? redirectionLink;

  NewsArticleModel(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.newsTitle,
      this.newsBody,
      this.image,
      this.redirectionLink});

  NewsArticleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    newsTitle = json['news_title'];
    newsBody = json['news_body'];
    image = json['image'];
    redirectionLink = json['redirection_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['news_title'] = this.newsTitle;
    data['news_body'] = this.newsBody;
    data['image'] = this.image;
    data['redirection_link'] = this.redirectionLink;
    return data;
  }
}
