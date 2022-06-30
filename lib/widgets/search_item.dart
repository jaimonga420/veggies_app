import 'package:flutter/material.dart';

import '../ui/colors.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(children: [
        Expanded(
          child: SizedBox(
            height: 100,
            child: Center(
              child: Image.network(
                  'https://freepngimg.com/thumb/apple/9-apple-png-image.png'),
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
                  children: const [
                    Text(
                      'productName',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '₹50/kg',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Container(
                  height: 35,
                  width: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        '50gm',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xffd0b84c),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 35,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 32),
            child: Container(
              height: 17,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Add to cart',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
