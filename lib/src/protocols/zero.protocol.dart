import 'package:flutter/material.dart';
import 'package:reddisney_plus/src/entity/token.entity.dart';
import 'package:reddisney_plus/src/protocols/base.protocol.dart';

abstract class ZViewToZPresenter extends BaseProtocol <
  ZPresenterToZView,
  ZPresenterToZInteractor,
  ZPresenterToZRouter
> {
  startFetchingToken(String refreshToken);
  showInitController();
  showProfilesController();
}

abstract class ZPresenterToZView {
  error();
  success();
}

abstract class ZPresenterToZRouter {
  pushToInitScreen(BuildContext context);
  pushToProfilesScreen(BuildContext context);
}

abstract class ZPresenterToZInteractor {
  ZInteractorToZPresenter presenter;
  fetchToken(String token);
}

abstract class ZInteractorToZPresenter {
  grantFetchedSuccess(TokenEntity grantEntity);
  grantFetchFailed();
}