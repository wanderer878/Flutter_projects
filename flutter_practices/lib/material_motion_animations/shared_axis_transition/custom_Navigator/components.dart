import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_practices/material_motion_animations/shared_axis_transition/custom_Navigator/Homepage.dart';
import 'package:flutter_practices/material_motion_animations/shared_axis_transition/custom_Navigator/SearchPage.dart';

class SharedAxisTransitionPageWrapper extends Page {
  final ValueKey transitionKey;
  final Widget child;

  SharedAxisTransitionPageWrapper(
      {super.key,
      super.name,
      super.arguments,
      super.restorationId,
      required this.transitionKey,
      required this.child});

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        settings: this,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SharedAxisTransition(animation: animation, secondaryAnimation: secondaryAnimation, transitionType: SharedAxisTransitionType.scaled, child: child,);
        },
        pageBuilder: (_, Animations, secondaryAnimations) => child);
  }
}

class customNavigator extends StatefulWidget {
  const customNavigator({super.key});

  @override
  State<customNavigator> createState() => _customNavigatorState();
}

class _customNavigatorState extends State<customNavigator> {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  bool showSearchPage = false;

  bool _handlePopPage(Route<dynamic> route,result){
    if(!route.didPop(result)){
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
            transitionKey: ValueKey("HomePage"), child: Homepage(
              callback: (){
                setState(() {
                  showSearchPage = true;
                });
              },
            )),

        if(showSearchPage)
          SharedAxisTransitionPageWrapper(
            transitionKey: ValueKey("SearchPage"), child: Searchpage()),
      ],
    );
  }
}


