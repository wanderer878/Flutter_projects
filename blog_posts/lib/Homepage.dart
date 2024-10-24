import 'package:animations/animations.dart';
import 'package:blog_posts/components/Add_Edit_blog.dart';
import 'package:blog_posts/Blog_provider.dart';
import 'package:blog_posts/Showblog.dart';
import 'package:blog_posts/cubit/Blog_cubit.dart';
import 'package:blog_posts/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  const Homepage({
    super.key,
    required this.Callback,
    required this.closeContainercallback,
  });
  final Function Callback;
  final void Function() closeContainercallback;
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        appBar: AppBar(
          title: Text('Home Page'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.brightness_2_outlined),
                onPressed: BlocProvider.of<BlogCubit>(context, listen: false)
                    .toggleThemeMode)
          ],
        ),
        body: BlocBuilder<BlogCubit, state_class>(builder: (context, state) {
          //print(state);
          return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 5),
              itemCount: state.list.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 5.0),
                  child: OpenContainer(
                      closedColor: Theme.of(context).colorScheme.primary,
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
                                  BlocProvider.of<BlogCubit>(context,
                                          listen: false)
                                      .deleteblog(index);
                                });
                              },
                              child: Center(
                                  child: ListTile(
                                tileColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                title: Text(
                                  state.list[index]['title']!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                subtitle: Text(
                                  state.list[index]['content'].toString(),
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
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
        })
        /*Consumer<Blog_provider>( 
        builder: (context, value, child) {
          return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 5),
              itemCount: value.items.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 5.0),
                  child: OpenContainer(
                      closedColor: Theme.of(context).colorScheme.primary,
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
                                tileColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                title: Text(
                                  value.items[index]['title']!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                subtitle: Text(
                                  value.items[index]['content'].toString(),
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
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
      ),*/
        );
  }
}
