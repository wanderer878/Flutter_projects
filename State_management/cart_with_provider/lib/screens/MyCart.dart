import 'package:cart_with_provider/Notifying_classes/Items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Consumer<Items>(builder: (context, items, child) {
          return items.selectedItems.isNotEmpty
              ? ListView.builder(
                  itemCount: items.selectedItems.length,
                  itemBuilder: (context, index) {
                    return Text(items.selectedItems[index].toString());
                  })
              : Text('cart is empty');
        }),
      ),
    );
  }
}
