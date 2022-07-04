import 'package:flutter/material.dart';

import '../ui/colors.dart';
import '../widgets/homescreen/quantity_selector.dart';

class SearchItem extends StatelessWidget {
  const SearchItem(
      {required this.productName,
      required this.imagePath,
      required this.price,
      Key? key})
      : super(key: key);

  final String imagePath;
  final String productName;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(children: [
        Expanded(
          child: SizedBox(
            height: 80,
            child: Center(
              child: Image.network(
                imagePath,
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 100,
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
                      style: TextStyle(color: Colors.grey.shade800),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                  width: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              ],
            ),
          ),
        ),
        QuantitySelector(
          productName: productName,
          imagePath: imagePath,
          price: price,
        ),
      ]),
    );
  }
}
