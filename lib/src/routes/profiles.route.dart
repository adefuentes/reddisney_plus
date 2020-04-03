import 'package:flutter/cupertino.dart';
import 'package:reddisney_plus/src/interactor/profiles.interactor.dart';
import 'package:reddisney_plus/src/presenter/profiles.presenter.dart';
import 'package:reddisney_plus/src/protocols/profiles.protocol.dart';
import 'package:reddisney_plus/src/routes/main.route.dart';
import 'package:reddisney_plus/src/views/profiles.screen.dart';

class ProfilesRoute extends CupertinoPageRoute implements PPresenterToPRouter {

  static final instance = ProfilesRoute(builder: (BuildContext context) {

    ProfilesPresenter presenter = ProfilesPresenter();
    ProfilesInteractor interactor = ProfilesInteractor();
    
    interactor.presenter = presenter;
    presenter.interactor = interactor;
    presenter.context = context;
    presenter.router = ProfilesRoute.instance;
    presenter.view = ProfilesPageState();

    return ProfilesScreen(presenter: presenter);
  });

  final WidgetBuilder builder;

  ProfilesRoute({this.builder}) : super(builder: builder);

  @override
  pushToMainView(BuildContext context) {
    Navigator.pushReplacement(context, MainRoute.instance);
  }

}