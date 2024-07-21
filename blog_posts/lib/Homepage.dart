import 'package:blog_posts/Addblog.dart';
import 'package:blog_posts/Blog_provider.dart';
import 'package:blog_posts/Showblog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_generator/word_generator.dart';

class CustomNavigator extends StatefulWidget {
  const CustomNavigator({super.key});

  @override
  State<CustomNavigator> createState() => _CustomNavigatorState();
}

class _CustomNavigatorState extends State<CustomNavigator> {
  bool _showDetails = false;
  static final GlobalKey<NavigatorState> nav_key =
      new GlobalKey<NavigatorState>();
  bool checkPop(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: nav_key,
        onPopPage: (route, result) {
          return checkPop(route, result);
        },
        pages: [
          PageWrapper(child: Homepage(
            Callback: (int index) {
              setState(() {
                _showDetails = true;
              });
            },
          )),
        ],
      ),
    );
  }
}

class PageWrapper extends Page {
  final Widget child;

  PageWrapper(
      {super.key,
      super.name,
      super.arguments,
      super.restorationId,
      required this.child});
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(settings: this, builder: (_) => child);
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.Callback});
  final Function Callback;
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final _blogProvider = Provider.of<Blog_provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 5),
          itemCount: _blogProvider.items.length,
          itemBuilder: (_, index) {
            return InkWell(
                child: Center(
                    child: ListTile(
                  title: Text(_blogProvider.items[index]['title']!),
                  subtitle:
                      Text(_blogProvider.items[index]['content'].toString()),
                )),
                onTap: widget.Callback());
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Addbloag()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
