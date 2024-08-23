import 'dart:ui';

import 'package:backdrop/backdrop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CardGrid extends StatelessWidget {
  CardGrid({super.key});

  List<String> _assests = [
    "assets/images/flower.jpg",
    "assets/images/gamer.jpg",
    "assets/images/samsung-memory-nuRvQVPWXCk-unsplash.jpg",
    "assets/images/samsung-memory-zoiIncvoQtE-unsplash.jpg",
    "assets/images/steve-gribble-Nl9juSM9mvM-unsplash.jpg",
  ];

  List<Card> _list() => List.generate(5, (index) {
        return Card(
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
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
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Card Grid'),
    //   ),
    //   body: GridView.count(
    //     childAspectRatio: 8.0 / 9.0,
    //     crossAxisCount: 2,
    //     mainAxisSpacing: 3,
    //     children: _list(),
    //   ),
    // );

    return BackdropScaffold(
      //frontLayerBorderRadius: BorderRadius.only(topLeft: Radius.circular(46)),
      frontLayerShape: BeveledRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40))),
      appBar: BackdropAppBar(
        title: Text('Right backdrop'),
      ),
      backLayer: Center(child: Text('back layer')),
      // frontLayer: Center(
      //   child: Text('front layer'),
      // )
      frontLayer: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: GridView.count(
          childAspectRatio: 8.0 / 9.0,
          crossAxisCount: 2,
          mainAxisSpacing: 3,
          children: _list(),
        ),
      ),
    );
  }
}
