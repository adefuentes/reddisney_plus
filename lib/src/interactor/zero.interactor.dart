import 'package:flutter/cupertino.dart';
import 'package:reddisney_plus/src/db/cloud_store.dart';
import 'package:reddisney_plus/src/entity/token.entity.dart';
import 'package:reddisney_plus/src/protocols/zero.protocol.dart';

class ZeroInteractor implements ZPresenterToZInteractor {

  @override
  ZInteractorToZPresenter presenter;

  @override
  fetchToken(String refreshToken) {

    var collectionToken = CloudStore.instance.collection("token");

    Map<String, dynamic> request = {
      "grant_type": "refresh_token",
      "latitude": "0",
      "longitude": "0",
      "platform": "browser",
      "refresh_token": refreshToken
    };

    collectionToken.fetch("exchange", request).then((tResponse){
      
      print(tResponse);

      TokenEntity token = TokenEntity.fromJson(tResponse);
      this.presenter.grantFetchedSuccess(token);

    });
  }

}