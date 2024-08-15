import 'package:blog_posts/Blog_provider.dart';
import 'package:blog_posts/Homepage.dart';
import 'package:blog_posts/components/Add_Edit_blog.dart';
import 'package:blog_posts/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page_wrapper.dart';
import 'pagetransition_switcher_wrapper.dart';

class CustomNavigator extends StatefulWidget {
  const CustomNavigator({
    super.key,
  });
  @override
  State<CustomNavigator> createState() => _CustomNavigatorState();
}

class _CustomNavigatorState extends State<CustomNavigator> {
  bool _showDetails = false, _showAdd = false;
  int _index = 0;

  static final GlobalKey<NavigatorState> nav_key =
      new GlobalKey<NavigatorState>();
  bool checkPop(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) {
      return false;
    }

    setState(() {
      _showDetails = false;
      _showAdd = false;
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
          PageWrapper(
              child: Homepage(
            closeContainercallback: () {
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
          if (_showAdd)
            PageWrapper(
                child: Add_Edit_blog(
              barTitle: "Add Blog",
              buttonText: "Add ",
              callback: (String text, String content) {
                Provider.of<Blog_provider>(context, listen: false)
                    .addblog(text, content);
                Navigator.pop(context);
              },
            ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDetails
                ? Navigator.push(
                    context,
                    route(Add_Edit_blog(
                      barTitle: "Edit blog",
                      buttonText: "Edit",
                      title: _blogList[_index]['title'],
                      content: _blogList[_index]['content'],
                      callback: (String text, String content) {
                        Provider.of<Blog_provider>(context, listen: false)
                            .editblog(text, content, _index);
                        Navigator.pop(context);
                      },
                    )))
                : setState(() {
                    _showAdd = true;
                  });
          },
          child: PagetransitionSwitcherWrapper(
            child: _showDetails
                ? Icon(Icons.edit, key: UniqueKey())
                : Icon(Icons.add),
          )),
    );
  }
}
