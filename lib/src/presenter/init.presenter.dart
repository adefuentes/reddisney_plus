
import 'package:flutter/material.dart';
import 'package:reddisney_plus/src/db/cloud_store.dart';
import 'package:reddisney_plus/src/entity/grant.entity.dart';
import 'package:reddisney_plus/src/entity/token.entity.dart';
import 'package:reddisney_plus/src/protocols/init.protocol.dart';

class InitPresenter implements IViewToIPresenter, IInteractorToPresenter {

  BuildContext context;

  @override
  IPresenterToIInteractor interactor;

  @override
  IPresenterToIRouter router;

  @override
  IPresenterToIView view;

  @override
  grantFetchedSuccess(TokenEntity tokenEntity) {
    CloudStore.token = tokenEntity.accessToken;
    CloudStore.refreshToken = tokenEntity.refreshToken;
  }

  @override
  grantFetchFailed() {
    view.showError();
  }

  @override
  showAuthController() {
    router.pushToAuthScreen(this.context);
  }

  @override
  startFetchingGrant() {
    interactor.fetchGrant();
  }
  
}