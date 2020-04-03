import 'package:flutter/material.dart';
import 'package:reddisney_plus/src/entity/token.entity.dart';
import 'package:reddisney_plus/src/protocols/base.protocol.dart';

abstract class IViewToIPresenter extends BaseProtocol <
  IPresenterToIView,
  IPresenterToIInteractor,
  IPresenterToIRouter
> {
  startFetchingGrant() {}
  showAuthController() {}
}

abstract class IPresenterToIView {
  showError() {}
}

abstract class IPresenterToIRouter {
  pushToAuthScreen(BuildContext context) {}
}

abstract class IPresenterToIInteractor {
  IInteractorToPresenter presenter;
  fetchGrant(){}
}

abstract class IInteractorToPresenter {
  grantFetchedSuccess(TokenEntity grantEntity){}
  grantFetchFailed() {}
}