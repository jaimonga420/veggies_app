import 'package:flutter/material.dart';

import '../ui/colors.dart';
import '../widgets/app_drawer.dart';
import '../widgets/custom_appbar.dart';

class SingleProductScreen extends StatefulWidget {
  const SingleProductScreen({Key? key}) : super(key: key);

  static const routeName = '/singleproductscreen';

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  
    return Scaffold(
      backgroundColor: const Color(0xffcbcbcb),
      drawer: const AppDrawer(),
      appBar: const CustomAppBar(title: 'Veggies App'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                iconSize: 30,
              ),
              SizedBox(
                  height: 200,
                  width: 500,
                  child: Image.network(
                    routeArgs['imagePath'],
                    fit: BoxFit.contain,
                  )),
              Text(
                routeArgs['productName'],
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ultricies lobortis vestibulum. Sed porttitor diam eget dictum congue. Nulla hendrerit massa non porta vehicula. Cras vehicula scelerisque mi eget scelerisque.',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15,
                ),
              ),
              quantitySelector('500gm', routeArgs['price']),
              quantitySelector('1Kg', routeArgs['price']),
              quantitySelector('2Kg', routeArgs['price']),
            ],
          ),
        ]),
      ),
    );
  }

  Widget quantitySelector(String quan, int price) {
    String text;
    switch (quan) {
      case '500gm':
        text = '${(price * 0.5).round()} ';
        break;
      case '2Kg':
        text = '${(price * 2 * 0.9).round()} ';
        break;
      default:
        text = '$price';
    }
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quan,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '₹$text',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            width: 80,
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
        ],
      ),
    );
  }
}
