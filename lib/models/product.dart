class Product {
  final String name;
  final double price;
  final String description;
  final String imagePath;
  int quantity;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    this.quantity = 1, // default 1
  });
}