
import 'package:flutter/cupertino.dart';
import 'package:reddisney_plus/src/interactor/auth.interactor.dart';
import 'package:reddisney_plus/src/presenter/auth.presenter.dart';
import 'package:reddisney_plus/src/routes/profiles.route.dart';
import 'package:reddisney_plus/src/views/auth.screen.dart';
import 'package:reddisney_plus/src/protocols/auth.protocol.dart';

class AuthRoute extends CupertinoPageRoute implements APresenterToARouter {

  static final instance = AuthRoute(builder: (BuildContext context) {

    AuthPresenter presenter = AuthPresenter();
    AuthInteractor interactor = AuthInteractor();
    
    interactor.presenter = presenter;
    presenter.interactor = interactor;
    presenter.context = context;
    presenter.router = AuthRoute.instance;
    presenter.view = AuthPageState();

    return AuthScreen(presenter: presenter);
  });

  final WidgetBuilder builder;

  AuthRoute({this.builder}) : super(builder: builder);

  @override
  pushToMainScreen(BuildContext context) {
    Navigator.pushReplacement(context, ProfilesRoute.instance);
  }

}