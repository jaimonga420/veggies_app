import 'package:flutter/material.dart';
import 'package:veggies_app/ui/colors.dart';

class OrderItem extends StatelessWidget {
  const OrderItem(
      {required this.imagePath,
      required this.price,
      required this.productName,
      required this.quantity,
      required this.totalPrice,
      Key? key})
      : super(key: key);

  final String imagePath;
  final String productName;
  final int price;
  final int quantity;
  final int totalPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 83,
            child: Center(
              child: Image.network(imagePath),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 83,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '₹${price.toString()}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Qty: ${quantity.toString()}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: SizedBox(
          height: 83,
          child: Center(
            child: Text(
              '₹${totalPrice.toString()}',
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: AppColor.primaryColor),
            ),
          ),
        ))
      ],
    );
  }
}
