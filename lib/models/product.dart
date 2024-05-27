class Product {
  String name;
  double price;
  bool inStock;

  Product({
    required this.name,
    required this.price,
    required this.inStock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      inStock: json['inStock'],
    );
  }
}
