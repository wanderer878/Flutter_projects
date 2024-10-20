import 'dart:ui';

import 'package:backdrop/backdrop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practices/MDC_codelabs/adaptiveImages.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CardGrid extends StatefulWidget {
  CardGrid({super.key});

  @override
  State<CardGrid> createState() => _CardGridState();
}

class _CardGridState extends State<CardGrid>
    with SingleTickerProviderStateMixin {
  int _currentindex = 0;
  List<Widget> _pages = [GridList(), Aboutsc()];
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
        onBackLayerRevealed: () {
          setState(() {
            _animationController.forward();
          });
        },
        onBackLayerConcealed: () {
          setState(() {
            _animationController.reverse();
          });
        },
        animationCurve: Curves.decelerate,
        frontLayerShape: BeveledRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40))),
        appBar: BackdropAppBar(
          titleSpacing: 1,
          title: OverflowBar(alignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0, right: 5.0),
              child: AnimatedIcon(
                  color: Theme.of(context).colorScheme.surface,
                  size: 24,
                  icon: AnimatedIcons.add_event,
                  progress: _animationController),
              // child: Icon(
              //   Icons.diamond,
              //   size: 30,
              //   color: Theme.of(context).colorScheme.surface,
              // ),
            ),
            Text('Right backdrop')
          ]),
        ),
        backLayer: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            BackdropNavigationBackLayer(
              items: [
                Menu_item(
                  MenuName: "Home",
                  index: 0,
                  selectedIndex: _currentindex,
                ),
                Menu_item(
                  MenuName: "About",
                  index: 1,
                  selectedIndex: _currentindex,
                )
              ],
              onTap: (index) {
                setState(() {
                  _currentindex = index;
                });
              },
            ),
          ],
        ),
        frontLayer: _pages[_currentindex]);
  }
}

class Aboutsc extends StatelessWidget {
  const Aboutsc({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
            softWrap: true,
            "Tech Rider is a forward-thinking technology company dedicated to delivering innovative software solutions that empower businesses to thrive in the digital age. With a strong focus on cutting-edge technologies and customer-centric design, Tech Rider specializes in developing scalable mobile and web applications tailored to meet the unique needs of our clients.At Tech Rider, we believe in harnessing the power of technology to drive growth and efficiency. Our team of experienced developers, designers, and engineers work collaboratively to create intuitive, user-friendly products that not only solve problems but also enhance user experiences. From custom app development to cloud-based solutions, our expertise spans a wide range of industries, including e-commerce, healthcare, finance, and more.Innovation is at the core of everything we do. We are committed to staying ahead of the curve by constantly exploring new technologies, methodologies, and approaches to ensure that our clients benefit from the latest advancements. Our agile development process ensures quick turnaround times without compromising on quality, allowing us to deliver projects on time and within budget."),
      ),
    );
  }
}

class GridList extends StatelessWidget {
  GridList({super.key});

  List<String> _assests = [
    "https://cdn.pixabay.com/photo/2023/02/07/17/49/supercar-7774683_640.jpg",
    "https://img.freepik.com/premium-photo/modern-automobile-classic-technology-wheel-traffic_665346-119.jpg",
    "https://images.unsplash.com/photo-1726609939114-78ca262451e9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyNXx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1721332155637-8b339526cf4c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzMHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1726587912121-ea21fcc57ff8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzOHx8fGVufDB8fHx8fA%3D%3D",
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
                          child: Adaptiveimages(
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
                      Adaptiveimages(
                        _assests[index],
                        fit: BoxFit.fitWidth,
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
    required this.index,
    required this.selectedIndex,
  });

  final String MenuName;
  final int index, selectedIndex;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(children: [
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: index == selectedIndex
                      ? BorderSide(
                          color: Theme.of(context).colorScheme.surface,
                          width: 2.0)
                      : BorderSide.none)),
          child: Text(
            selectionColor: Colors.amber,
            MenuName,
            style: TextStyle(
              color: Theme.of(context).colorScheme.surface,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }
}
