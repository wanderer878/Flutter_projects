import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practices/material_motion_animations/ProviderClass.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> games_list = Provider.of<Providerclass>(context).games;
    return Scaffold(
        appBar: AppBar(
          title: Text('List Screen (material motion)'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: games_list.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Text(games_list[index]),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
