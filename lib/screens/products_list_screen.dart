import 'package:flutter/material.dart';

import '../ui/colors.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/app_drawer.dart';
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
        drawer: const AppDrawer(),
        body: Column(
          children: [
            Container(
              height: 52,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 10, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Search for an item',
                    suffixIcon: const Icon(Icons.search)),
              ),
            ),
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
        ));
  }
}
