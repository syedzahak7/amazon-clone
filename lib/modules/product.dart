class Product {
final String imageUrl;
final String name;
final double price;
final String? description; // Making description optional by using String?

Product({
  required this.imageUrl,
  required this.name,
  required this.price,
  this.description,
});
}