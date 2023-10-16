import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:testing_codelab/models/favorites.dart';
import 'package:testing_codelab/screens/favourites.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing Sample'),
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {
                context.go('/${FavoritesPage.routeName}');
              },
              icon: Icon(Icons.favorite_outline),
              label: Text('Favorite'))
        ],
      ),
      body: ListView.builder(
          itemCount: 100,
          cacheExtent: 20,
          itemBuilder: (context, index) {
            return ItemTile(index);
          }),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(this.itemNo, {super.key});

  @override
  Widget build(BuildContext context) {
    var favouritesList = Provider.of<Favourites>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text('item $itemNo'),
        trailing: IconButton(
            key: Key("icon_$itemNo"),
            onPressed: () {
              !favouritesList.items.contains(itemNo)
                  ? favouritesList.add(itemNo)
                  : favouritesList.remove(itemNo);

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: favouritesList.items.contains(itemNo)
                      ? Text('Item Added Sucessfully')
                      : Text('Item Removed Sucessfully')));
            },
            icon: favouritesList.items.contains(itemNo)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)),
      ),
    );
  }
}
