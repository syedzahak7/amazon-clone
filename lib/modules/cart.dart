class Cart{
final String imageUrl;
final String name;
final double price;
final int quantity; // Making description optional by using String?

Cart({
  required this.imageUrl,
  required this.name,
  required this.price,
  required this.quantity,
});
}