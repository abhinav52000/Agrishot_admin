class ArticleModel {
  String? id;
  String? language;
  List<int>? category;
  String? author;
  String? title;
  String? description;
  String? mediaslug;
  String? readMoreUrl;
  String? source;
  void sponsored;
  void sponsoredby;
  String? createdAt;
  void categories;
  String? type;

  ArticleModel(
      {this.id,
      this.language,
      this.category,
      this.author,
      this.title,
      this.description,
      this.mediaslug,
      this.readMoreUrl,
      this.source,
      this.sponsored,
      this.sponsoredby,
      this.createdAt,
      this.categories,
      this.type});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    language = json['language'];
    category = json['category'].cast<int>();
    author = json['author'];
    title = json['title'];
    description = json['description'];
    mediaslug = json['mediaslug'];
    readMoreUrl = json['readMoreUrl'];
    source = json['source'];
    sponsored = json['sponsored'];
    sponsoredby = json['sponsoredby'];
    createdAt = json['createdAt'];
    categories = json['categories'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['language'] = language;
    data['category'] = category;
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['mediaslug'] = mediaslug;
    data['readMoreUrl'] = readMoreUrl;
    data['source'] = source;
    data['sponsored'];
    data['sponsoredby'];
    data['createdAt'] = createdAt;
    data['categories'];
    data['type'] = type;
    return data;
  }
}
