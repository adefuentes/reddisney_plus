
import 'package:flutter/cupertino.dart';
import 'package:reddisney_plus/src/routes/auth.route.dart';
import 'package:reddisney_plus/src/views/init.screen.dart';
import 'package:reddisney_plus/src/protocols/init.protocol.dart';
import 'package:reddisney_plus/src/presenter/init.presenter.dart';
import 'package:reddisney_plus/src/interactor/init.interactor.dart';

class InitRoute extends PageRouteBuilder implements IPresenterToIRouter {

  static final instance = InitRoute(pageBuilder: (BuildContext context, animation, secondaryAnimation) {

    InitPresenter presenter = InitPresenter();
    InitInteractor interactor = InitInteractor();
    
    interactor.presenter = presenter;
    presenter.interactor = interactor;
    presenter.context = context;
    presenter.router = InitRoute.instance;

    return InitScreen(presenter: presenter);
  });

  final RoutePageBuilder pageBuilder;
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

  InitRoute({this.pageBuilder}) : super(
    pageBuilder: pageBuilder,
    transitionsBuilder: InitRoute.transitionBuilder
  );

  @override
  pushToAuthScreen(BuildContext context) {
    Navigator.pushReplacement(context, AuthRoute.instance);
  }


}