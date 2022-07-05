import 'package:flutter/material.dart';
import './quantity_selector.dart';

import '../../screens/single_product_screen.dart';

class VeggiesContainer extends StatefulWidget {
  const VeggiesContainer(
      {required this.productName,
      required this.imagePath,
      required this.price,
      Key? key})
      : super(key: key);

  final String productName;
  final String imagePath;
  final int price;

  @override
  State<VeggiesContainer> createState() => _VeggiesContainerState();
}

class _VeggiesContainerState extends State<VeggiesContainer> {
  @override
  Widget build(BuildContext context) {
    final productName = widget.productName;
    final imagePath = widget.imagePath;
    final price = widget.price;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 250,
      width: 180,
      decoration: BoxDecoration(
          color: const Color(0xffd9dad9),
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(SingleProductScreen.routeName,
                  arguments: {
                    'productName': productName,
                    'imagePath': imagePath,
                    'price': price
                  });
            },
            child: SizedBox(
              width: 150,
              height: 150,
              child: Image.network(
                widget.imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productName,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
                Text(
                  '₹${widget.price.toString()}/Kg',
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 14),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '1Kg',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    QuantitySelector(
                        productName: productName,
                        imagePath: imagePath,
                        price: price)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
