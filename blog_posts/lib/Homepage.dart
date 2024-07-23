import 'package:animations/animations.dart';
import 'package:blog_posts/components/Add_Edit_blog.dart';
import 'package:blog_posts/Blog_provider.dart';
import 'package:blog_posts/Showblog.dart';
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
      required this.closeContainercallback});
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
                return OpenContainer(closedBuilder: (_, openContainer) {
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
                }, openBuilder: (_, closeContainer) {
                  return Showblog(
                    index: index,
                    onClose: () => widget.closeContainercallback(),
                  );
                });
              });
        },
      ),
    );
  }
}
