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
              ? Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: items.selectedItems.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    '> ${items.selectedItems[index].word.toString()}'),
                              );
                            }),
                      ),
                      const Divider(
                        height: 4,
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$ ${items.total_price()}',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                          )
                        ],
                      )
                    ],
                  ),
                )
              : Center(child: Text('cart is empty'));
        }),
      ),
    );
  }
}
