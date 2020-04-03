import 'package:flutter/cupertino.dart';
import 'package:reddisney_plus/src/views/main.screen.dart';

class MainRoute extends PageRouteBuilder {

  static final instance = MainRoute(builder: (BuildContext context, animation, secondaryAnimation) {

    return MainScreen();
  });

  final RoutePageBuilder builder;
  static RouteTransitionsBuilder transitionBuilder = (context, animation, secondaryAnimation, child) {
    // var begin = Offset(0.0, 1.0);
    // var end = Offset.zero;
    // var curve = Curves.ease;

    // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return FadeTransition(
      opacity: animation,
      child: child,
    );
  };

  MainRoute({this.builder}) : super(
    pageBuilder: builder,
    transitionsBuilder: MainRoute.transitionBuilder
  );


}