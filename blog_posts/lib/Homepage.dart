import 'package:animations/animations.dart';
import 'package:blog_posts/components/Add_Edit_blog.dart';
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
  int _index = 0;

  static final GlobalKey<NavigatorState> nav_key =
      new GlobalKey<NavigatorState>();
  bool checkPop(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) {
      return false;
    }

    setState(() {
      _showDetails = false;
    });

    return true;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _blogList =
        Provider.of<Blog_provider>(context).items;
    return Scaffold(
      body: Navigator(
        key: nav_key,
        onPopPage: (route, result) {
          return checkPop(route, result);
        },
        pages: [
          PageWrapper(child: Homepage(
            closeContainercallback: (){
              setState(() {
                _showDetails = false;
              });
            },
            Callback: (int index) {
              setState(() {
                _index = index;
                _showDetails = true;
              });
            },
          )),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => _showDetails
                      ? Add_Edit_blog(
                          barTitle: "Edit blog",
                          buttonText: "Edit",
                          title: _blogList[_index]['title'],
                          content: _blogList[_index]['content'],
                          callback: (String text, String content) {
                            Provider.of<Blog_provider>(context, listen: false)
                                .editblog(text, content, _index);
                            Navigator.pop(context);
                          },
                        )
                      : Add_Edit_blog(
                          barTitle: "Add Blog",
                          buttonText: "Add ",
                          callback: (String text, String content) {
                            Provider.of<Blog_provider>(context, listen: false)
                                .addblog(text, content);
                            Navigator.pop(context);
                          },
                        )));
        },
        child: Icon(_showDetails ? Icons.edit : Icons.add),
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
  const Homepage({super.key, required this.Callback, required this.closeContainercallback});
  final Function Callback;
  final void Function() closeContainercallback;
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Consumer<Blog_provider>(
        builder: (context, value, child) {
          return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 5),
              itemCount: value.items.length,
              itemBuilder: (_, index) {
                return OpenContainer(closedBuilder: (_,openContainer){
                  return InkWell(
                    child: Dismissible(
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        setState(() {
                          Provider.of<Blog_provider>(context, listen: false)
                              .deleteblog(index);
                        });
                      },
                      child: Center(
                          child: ListTile(
                        title: Text(value.items[index]['title']!),
                        subtitle:
                            Text(value.items[index]['content'].toString()),
                      )),
                    ),
                    onTap: () {
                      widget.Callback(index);
                      openContainer();
                    });
                },
                 openBuilder: (_,closeContainer){
                  return Showblog(index: index, onClose: ()=> widget.closeContainercallback(),);
                  
                 });
                
              });
        },
      ),
    );
  }
}
