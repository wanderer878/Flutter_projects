import 'package:first_app_codelab/Favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int selectIndex;

  final List<NavigationRailDestination> destinations = [
    const NavigationRailDestination(
        icon: Icon(Icons.home), label: Text('Home')),
    const NavigationRailDestination(
        icon: Icon(Icons.favorite), label: Text('Favorites')),
  ];

  @override
  void initState() {
    super.initState();
    selectIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Row(
        children: [
          NavigationRail(
              destinations: destinations, selectedIndex: selectIndex),
          Expanded(
            child: Home_Widget(),
            flex: 1,
          ),
        ],
      ),
    );
  }
}

class Home_Widget extends StatelessWidget {
  Home_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Favourites>(builder: (context, value, child) {
            return Card(
              child: Text(value.current_pair),
            );
          }),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer<Favourites>(builder: (context, value, child) {
                return TextButton.icon(
                    onPressed: () {
                      Provider.of<Favourites>(context, listen: false)
                          .toggle_Favs(value.current_pair);
                      print(value.fav.length);
                    },
                    icon: Icon(Icons.favorite_border),
                    label: Text("Like"));
              }),
              SizedBox(
                width: 20,
              ),
              TextButton(
                  onPressed: () {
                    Provider.of<Favourites>(context, listen: false).get_next();
                  },
                  child: Text("Next"))
            ],
          )
        ],
      ),
    );
  }
}
