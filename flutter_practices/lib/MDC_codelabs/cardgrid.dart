import 'dart:ui';

import 'package:backdrop/backdrop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CardGrid extends StatefulWidget {
  CardGrid({super.key});

  @override
  State<CardGrid> createState() => _CardGridState();
}

class _CardGridState extends State<CardGrid> {
  int _currentindex = 0;
  List _pages = [GridList(), Aboutsc()];
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
        animationCurve: Curves.decelerate,
        frontLayerShape: BeveledRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40))),
        appBar: BackdropAppBar(
          title: Text('Right backdrop'),
        ),
        backLayer: BackdropNavigationBackLayer(items: [
          SizedBox(
            height: 40,
          ),
          Menu_item(
            MenuName: "Home",
          ),
          Menu_item(MenuName: "About")
        ]),
        frontLayer: _pages[_currentindex]);
  }
}

class Aboutsc extends StatelessWidget {
  const Aboutsc({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}

class GridList extends StatelessWidget {
  GridList({super.key});

  List<String> _assests = [
    "assets/images/flower.jpg",
    "assets/images/gamer.jpg",
    "assets/images/samsung-memory-zoiIncvoQtE-unsplash.jpg",
    "assets/images/steve-gribble-Nl9juSM9mvM-unsplash.jpg",
    "assets/images/samsung-memory-nuRvQVPWXCk-unsplash.jpg",
  ];

  List<Card> _list() => List.generate(5, (index) {
        return Card(
          shape: BeveledRectangleBorder(
              borderRadius: index == 0
                  ? BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))
                  : BorderRadius.all(Radius.circular(10))),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                  aspectRatio: 10 / 8,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned.fill(
                          child: Image.asset(
                        _assests[index],
                        fit: BoxFit.fill,
                      )),
                      Positioned.fill(
                          child: BackdropFilter(
                              child: Container(
                                color: Colors.transparent,
                              ),
                              filter: ImageFilter.blur(
                                  sigmaX: 10.0, sigmaY: 10.0))),
                      Image.asset(
                        _assests[index],
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10, 5, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text((index + 1).toString()),
                    Text("bye bye nsync")
                  ],
                ),
              )
            ],
          ),
        );
      });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 8.0 / 9.0,
      crossAxisCount: 2,
      mainAxisSpacing: 3,
      children: _list(),
    );
  }
}

class Menu_item extends StatelessWidget {
  const Menu_item({
    super.key,
    required this.MenuName,
  });

  final String MenuName;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        MenuName,
        style: TextStyle(color: Theme.of(context).colorScheme.surface),
        textAlign: TextAlign.center,
      ),
    );
  }
}
