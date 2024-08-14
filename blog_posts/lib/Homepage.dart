import 'package:animations/animations.dart';
import 'package:blog_posts/components/Add_Edit_blog.dart';
import 'package:blog_posts/Blog_provider.dart';
import 'package:blog_posts/Showblog.dart';
import 'package:blog_posts/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_generator/word_generator.dart';

Route route(Widget child) {
  return PageRouteBuilder(
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      pageBuilder: (_, Animation, secondaryAnimation) => child);
}

class Homepage extends StatefulWidget {
  const Homepage(
      {super.key,
      required this.Callback,
      required this.closeContainercallback,
      required this.ChangeTheme});
  final Function Callback;
  final Function ChangeTheme;
  final void Function() closeContainercallback;
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.brightness_2_outlined), onPressed: changeTheme)
        ],
      ),
      body: Consumer<Blog_provider>(
        builder: (context, value, child) {
          return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 5),
              itemCount: value.items.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 3.0),
                  child: OpenContainer(
                      closedColor: Theme.of(context).primaryColor,
                      closedBuilder: (_, openContainer) {
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
                                  Provider.of<Blog_provider>(context,
                                          listen: false)
                                      .deleteblog(index);
                                });
                              },
                              child: Center(
                                  child: ListTile(
                                tileColor: Theme.of(context).primaryColor,
                                title: Text(
                                  value.items[index]['title']!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                subtitle: Text(
                                    value.items[index]['content'].toString()),
                              )),
                            ),
                            onTap: () {
                              widget.Callback(index);
                              openContainer();
                            });
                      },
                      openBuilder: (_, closeContainer) {
                        return Showblog(
                          index: index,
                          onClose: () => widget.closeContainercallback(),
                        );
                      }),
                );
              });
        },
      ),
    );
  }
}
