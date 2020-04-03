import 'package:flutter/cupertino.dart';
import 'package:reddisney_plus/src/db/cloud_store.dart';
import 'package:reddisney_plus/src/entity/token.entity.dart';
import 'package:reddisney_plus/src/protocols/zero.protocol.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ZeroPresenter implements ZViewToZPresenter, ZInteractorToZPresenter {

  BuildContext context;
  final Future<SharedPreferences> _shared = SharedPreferences.getInstance();

  @override
  ZPresenterToZInteractor interactor;

  @override
  ZPresenterToZRouter router;

  @override
  ZPresenterToZView view;

  @override
  grantFetchFailed() {
    view.error();
  }

  @override
  grantFetchedSuccess(TokenEntity tokenEntity) {
    CloudStore.token = tokenEntity.accessToken;
    CloudStore.refreshToken = tokenEntity.refreshToken;
    print("grantFetchedSuccess");
    print(tokenEntity);
    print(tokenEntity.accessToken);
    _shared.then((prefs) {
      prefs.setString("refreshToken", tokenEntity.refreshToken);
      view.success();
    });
  }

  @override
  showInitController() {
    router.pushToInitScreen(context);
  }

  @override
  startFetchingToken(String refreshToken) {
    interactor.fetchToken(refreshToken);
  }

  @override
  showProfilesController() {
    router.pushToProfilesScreen(context);
  }
    
}