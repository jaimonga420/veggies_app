import 'package:flutter/material.dart';

import '../ui/colors.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/search_item.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({Key? key}) : super(key: key);

  static const routeName = '/products-list-screen';

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  @override
  Widget build(BuildContext context) {
    final routeAgrs = ModalRoute.of(context)!.settings.arguments as List;

    return Scaffold(
        backgroundColor: AppColor.scaffoldColor,
        appBar: const CustomAppBar(title: 'Veggies List'),
        body: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: routeAgrs.length,
                    itemBuilder: (context, index) {
                      return SearchItem(
                          productName: routeAgrs[index].productName,
                          imagePath: routeAgrs[index].imagePath,
                          price: routeAgrs[index].price);
                    }),
              )
            ],
          ),
        ));
  }
}
