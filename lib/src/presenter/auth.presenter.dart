
import 'package:flutter/cupertino.dart';
import 'package:reddisney_plus/src/db/cloud_store.dart';
import 'package:reddisney_plus/src/entity/token.entity.dart';
import 'package:reddisney_plus/src/protocols/auth.protocol.dart';
import 'package:reddisney_plus/src/views/auth.screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPresenter implements AViewToAPresenter, AInteractorToAPresenter {

  Future<SharedPreferences> _shared = SharedPreferences.getInstance();
  BuildContext context;

  @override
  APresenterToAInteractor interactor;

  @override
  APresenterToARouter router;

  @override
  AuthPageState view;

  @override
  emailFetchedFailed() {
    view.wrongEmail();
  }

  @override
  emailFetchedSuccess() {
    print("emailFetchedSuccess");
    view.successEmail();
  }

  @override
  authFetchedFailed() {
    view.wrongAuth();
  }

  @override
  authFetchedSuccess(TokenEntity tokenEntity) {
    debugPrint(tokenEntity.refreshToken);

    CloudStore.token = tokenEntity.accessToken;
    CloudStore.refreshToken = tokenEntity.refreshToken;
    _shared.then((prefs) {
      prefs.setString("refreshToken", tokenEntity.refreshToken);
      view.successAuth();
    });
  }

  @override
  auth(String email, String pass) {
    interactor.fetchAuth(email, pass);
  }

  @override
  fetchEmail(String email) {
    interactor.fetchEmail(email);
  }

  @override
  showMainController() {
    router.pushToMainScreen(context);
  }

}