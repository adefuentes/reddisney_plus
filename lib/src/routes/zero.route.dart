
import 'package:flutter/cupertino.dart';
import 'package:reddisney_plus/src/protocols/zero.protocol.dart';
import 'package:reddisney_plus/src/routes/init.route.dart';
import 'package:reddisney_plus/src/routes/main.route.dart';

class ZeroRoute extends PageRouteBuilder implements ZPresenterToZRouter {

  final RoutePageBuilder pageBuilder;
  static RouteTransitionsBuilder transitionBuilder = (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  };

  ZeroRoute({this.pageBuilder}) : super(
    pageBuilder: pageBuilder,
    transitionsBuilder: ZeroRoute.transitionBuilder
  );

  @override
  pushToInitScreen(BuildContext context) {
    Navigator.pushReplacement(context, InitRoute.instance);
  }

  @override
  pushToProfilesScreen(BuildContext context) {
    Navigator.pushReplacement(context, MainRoute.instance);
  }


}