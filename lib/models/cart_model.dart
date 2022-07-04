class CartModel {
  String productName;
  String imagePath; 
  int price;
  int quantity;
  int totalPrice;

  CartModel(
      {required this.productName,
      required this.imagePath,
      required this.price,
      required this.quantity,
      required this.totalPrice});
}
