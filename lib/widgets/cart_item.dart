import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 83,
                child: Center(
                  child: Image.network(
                      'https://freepngimg.com/thumb/apple/9-apple-png-image.png'),
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
                      children: const [
                        Text(
                          'productName',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '₹50',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '1Kg',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                  height: 83,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 32),
                  child: Column(
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                      Container(
                        height: 35,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.remove,
                              color: Color(0xffd0b84c),
                              size: 18,
                            ),
                            Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Icon(
                              Icons.add,
                              color: Color(0xffd0b84c),
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
        const Divider(
          height: 1,
          color: Colors.black45,
        )
      ],
    );
  }
}
