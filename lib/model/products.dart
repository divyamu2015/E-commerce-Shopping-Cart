class Products {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;

  Products({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        image: json['image']);
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'imageUrl': image,
      'description': description,
    };
  }
}
