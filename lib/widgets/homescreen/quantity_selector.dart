import 'package:flutter/material.dart';
import '../../ui/colors.dart';

class QuantitySelector extends StatefulWidget {
  QuantitySelector({Key? key}) : super(key: key);

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: isAdded
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  padding: const EdgeInsets.only(right: 7),
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    if (quantity == 1) {
                      setState(() {
                        isAdded = false;
                      });
                    } else {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                  icon: const Icon(Icons.remove),
                  color: AppColor.iconColor,
                  iconSize: 18,
                ),
                Center(
                  child: Text(
                    quantity.toString(),
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                IconButton(
                  padding: const EdgeInsets.only(left: 7),
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  icon: const Icon(Icons.add),
                  color: AppColor.iconColor,
                  iconSize: 18,
                ),
              ],
            )
          : Center(
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      isAdded = true;
                      debugPrint(isAdded.toString());
                    });
                  },
                  child: Text('Add')),
            ),
    );
  }
}
