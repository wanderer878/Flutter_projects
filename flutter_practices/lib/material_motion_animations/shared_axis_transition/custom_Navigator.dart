import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart'
    show SharedAxisTransitionType, SharedAxisTransition;

import 'package:flutter/material.dart';
import 'package:flutter/material.dart'
    show SharedAxisTransitionType, SharedAxisTransition;

class MyAppWithCustomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Navigator'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CustomNavigator(),
                ),
              );
            },
          ),
        ],
      ),
      body: CustomNavigator(),
    );
  }
}

class CustomNavigator extends StatefulWidget {
  @override
  _CustomNavigatorState createState() => _CustomNavigatorState();
}

class _CustomNavigatorState extends State<CustomNavigator> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  bool showSearchPage = false;

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    setState(() {
      showSearchPage = false;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: (route, result) {
        return _handlePopPage(route, result);
      },
      pages: [
        SharedAxisTransitionPageWrapper(
          transitionKey: ValueKey('Home'),
          screen: FirstScreen(
            onSearchTapped: () {
              setState(() {
                showSearchPage = true;
              });
            },
          ),
        ),
        if (showSearchPage)
          SharedAxisTransitionPageWrapper(
            transitionKey: ValueKey('Search'),
            screen: SearchPage(),
          ),
      ],
    );
  }
}

class FirstScreen extends StatelessWidget {
  final VoidCallback onSearchTapped;

  FirstScreen({required this.onSearchTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: onSearchTapped,
          child: Text('Go to Search Page'),
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Go back to Home Page'),
        ),
      ),
    );
  }
}

class SharedAxisTransitionPageWrapper extends Page {
  const SharedAxisTransitionPageWrapper({
    required this.screen,
    required this.transitionKey,
  }) : super(key: transitionKey);

  final Widget screen;
  final ValueKey transitionKey;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.scaled,
          child: child,
        );
      },
    );
  }
}

class CustomTransitionPage extends Page {
  const CustomTransitionPage({
    required this.screen,
    required this.transitionKey,
  }) : super(key: transitionKey);

  final Widget screen;
  final ValueKey transitionKey;

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => screen,
    );
  }
}
