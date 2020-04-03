import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddisney_plus/src/extensions/colors.extension.dart';
import 'package:reddisney_plus/src/interactor/zero.interactor.dart';
import 'package:reddisney_plus/src/presenter/zero.presenter.dart';
import 'package:reddisney_plus/src/routes/zero.route.dart';
import 'package:reddisney_plus/src/views/zero.screen.dart';

void main() {
  runApp(RedDisneyApp());
}

class RedDisneyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    ZeroPresenter presenter = ZeroPresenter();
    ZeroInteractor interactor = ZeroInteractor();

    interactor.presenter = presenter;
    presenter.interactor = interactor;

    var view = ZeroScreen(presenter: presenter);

    presenter.view = view;
    presenter.router = ZeroRoute(pageBuilder: 
      (BuildContext context, animation, secondaryAnimation) => view 
    );

    return CupertinoApp(
      title: 'RedDisney+',
      home: view,
    );
  } 

}