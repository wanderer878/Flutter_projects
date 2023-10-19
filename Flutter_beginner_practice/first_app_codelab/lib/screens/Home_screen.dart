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
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Row(
          children: [
            NavigationRail(
              extended: constraints.maxWidth > 650 ? true : false,
              destinations: destinations,
              selectedIndex: selectIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectIndex = value;
                });
              },
            ),
            Expanded(
              flex: 1,
              child: selectIndex == 0 ? Home_Widget() : const fav_screen(),
            ),
          ],
        ),
      );
    });
  }
}

class Home_Widget extends StatelessWidget {
  Home_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider_state = Provider.of<Favourites>(context, listen: false);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Favourites>(builder: (context, value, child) {
            return Card(
              color: Theme.of(context).cardTheme.color,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  value.current_pair,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            );
          }),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                  onPressed: () {
                    provider_state.toggle_Favs(provider_state.current_pair);
                  },
                  icon: Consumer<Favourites>(builder: (context, value, child) {
                    return value.items.contains(value.current_pair)
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border);
                  }),
                  label: Text("Like")),
              SizedBox(
                width: 20,
              ),
              TextButton(
                  onPressed: () {
                    provider_state.get_next();
                  },
                  child: Text("Next"))
            ],
          )
        ],
      ),
    );
  }
}

class fav_screen extends StatelessWidget {
  const fav_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Consumer<Favourites>(builder: (context, value, child) {
      return ListView.builder(
          itemCount: value.items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                value.items[index],
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          });
    }));
  }
}
