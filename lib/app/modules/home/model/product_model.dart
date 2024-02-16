class Products {
  int? id;
  String? title;
  String? content;
  String? image;
  String? thumbnail;
  int? price;

  Products({
    this.id,
    this.title,
    this.content,
    this.image,
    this.thumbnail,
    this.price,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        thumbnail: json["thumbnail"],
        price: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "image": image,
        "thumbnail": thumbnail,
        "userId": price,
      };
}
