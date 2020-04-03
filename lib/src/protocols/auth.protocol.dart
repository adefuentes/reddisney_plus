import 'package:flutter/material.dart';
import 'package:reddisney_plus/src/entity/token.entity.dart';
import 'package:reddisney_plus/src/protocols/base.protocol.dart';
import 'package:reddisney_plus/src/views/auth.screen.dart';

abstract class AViewToAPresenter extends BaseProtocol <
  AuthPageState,
  APresenterToAInteractor,
  APresenterToARouter
> {
  fetchEmail(String email);
  auth(String email, String pass);
  showMainController();
}

abstract class APresenterToAView {
  successEmail();
  successAuth();
  wrongEmail();
  wrongAuth();
}

abstract class APresenterToARouter {
  pushToMainScreen(BuildContext context);
}

abstract class APresenterToAInteractor {
  AInteractorToAPresenter presenter;
  fetchEmail(String email);
  fetchAuth(String email, String pass);
}

abstract class AInteractorToAPresenter {
  emailFetchedSuccess();
  emailFetchedFailed();
  authFetchedSuccess(TokenEntity tokenEntity);
  authFetchedFailed();
}