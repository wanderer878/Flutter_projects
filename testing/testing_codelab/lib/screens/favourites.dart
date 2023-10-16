import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_codelab/models/favorites.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  static String routeName = 'favorites_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Consumer<Favourites>(builder: (context, value, child) {
        return ListView.builder(
            itemCount: value.items.length,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, index) {
              return FavoriteItemTile(value.items[index]);
            });
      }),
    );
  }
}

class FavoriteItemTile extends StatelessWidget {
  final itemNo;

  const FavoriteItemTile(this.itemNo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
          ),
          title: Text(
            'Item $itemNo',
            key: Key('favorites_text_$itemNo'),
          ),
          trailing: IconButton(
              key: Key('remove_icon_$itemNo'),
              onPressed: () {
                Provider.of<Favourites>(context, listen: false).remove(itemNo);
                ScaffoldMessenger.of(context)
                  ..clearSnackBars()
                  ..showSnackBar(
                      SnackBar(content: Text('Item Removed From Favorites')));
              },
              icon: Icon(Icons.close))),
    );
  }
}
