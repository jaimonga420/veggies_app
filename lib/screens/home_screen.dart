import 'package:flutter/material.dart';
import 'package:veggies_app/ui/colors.dart';
import 'package:provider/provider.dart';

import '../helpers/auth.dart';
import '../widgets/homescreen/veggies_container.dart';
import '../widgets/homescreen/home_banner.dart';
import '../widgets/app_drawer.dart';
import '../widgets/custom_appbar.dart';
import '../providers/product_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/homescreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = Auth();
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    productProvider.fetchvegetables();
    productProvider.fetchfruits();
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      drawer: const AppDrawer(),
      appBar: const CustomAppBar(title: 'Veggies App'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: ListView(
          children: [
            const HomeBanner(),
            const SizedBox(
              height: 30,
            ),
            headings('Herbs Seasoning'),
            SizedBox(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productProvider.vegetableslist.length,
                  itemBuilder: (context, index) {
                    return VeggiesContainer(
                        productName:
                            productProvider.vegetableslist[index].productName,
                        imagePath:
                            productProvider.vegetableslist[index].imagePath,
                        price: productProvider.vegetableslist[index].price);
                  }),
            ),
            const SizedBox(
              height: 30,
            ),
            headings('Fresh Fruits'),
            SizedBox(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productProvider.fruitslist.length,
                  itemBuilder: (context, index) {
                    return VeggiesContainer(
                        productName:
                            productProvider.fruitslist[index].productName,
                        imagePath: productProvider.fruitslist[index].imagePath,
                        price: productProvider.fruitslist[index].price);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget headings(String title) {
    return SizedBox(
      width: double.maxFinite,
      height: 30,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
