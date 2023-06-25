class Product {
  final String name;
  final String image;
  final String? price;
  final String? description;
  final int? color;

  Product(
      {required this.name,
      required this.image,
      this.price,
      this.description,
      this.color});
}
