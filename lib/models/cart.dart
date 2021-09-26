// ignore_for_file: file_names

class CartItem {
  String image, title, description;
  int price, id, quantity, productId;

  CartItem({
    required this.id,
    required this.productId,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.quantity,
  });
}
