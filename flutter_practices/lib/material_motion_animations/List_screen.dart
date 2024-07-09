import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practices/material_motion_animations/Details_screen.dart';
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
                      return TransformContainer(
                          index: index,
                          child: ListTile(
                            title: Text(games_list[index]),
                          ));
                    }),
              )
            ],
          ),
        ));
  }
}

class TransformContainer extends StatelessWidget {
  final int index;
  final Widget child;
  const TransformContainer(
      {super.key, required this.index, required this.child});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(closedBuilder: (_, opencontainer) {
      return InkWell(
        onTap: () {
          opencontainer();
        },
        child: child,
      );
    }, openBuilder: (_, closecontainer) {
      return DetailsScreen(index: index);
    },
    openColor: Theme.of(context).cardColor,
    );
  }
}
