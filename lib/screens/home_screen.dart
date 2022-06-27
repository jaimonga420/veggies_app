import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../helpers/auth.dart';
import '../widgets/homescreen/veggies_container.dart';
import '../widgets/homescreen/home_banner.dart';
import '../widgets/app_drawer.dart';
import '../widgets/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/homescreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = Auth();
  final Stream<QuerySnapshot> _vegStream =
      FirebaseFirestore.instance.collection('products').snapshots();
  final Stream<QuerySnapshot> _fruitStream =
      FirebaseFirestore.instance.collection('fruits').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffcbcbcb),
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
              child: StreamBuilder(
                  stream: _vegStream,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final documents = snapshot.data.docs;
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          return VeggiesContainer(
                              productName: documents[index]['productname'],
                              imagePath: documents[index]['imagepath'],
                              price: documents[index]['price']);
                        });
                  }),
            ),
            const SizedBox(
              height: 30,
            ),
            headings('Fresh Fruits'),
            SizedBox(
              height: 250,
              child: StreamBuilder(
                  stream: _fruitStream,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final documents = snapshot.data.docs;
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          return VeggiesContainer(
                              productName: documents[index]['productname'],
                              imagePath: documents[index]['imagepath'],
                              price: documents[index]['price']);
                        });
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
