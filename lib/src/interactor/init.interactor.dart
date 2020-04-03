import 'package:reddisney_plus/src/db/cloud_store.dart';
import 'package:reddisney_plus/src/entity/grant.entity.dart';
import 'package:reddisney_plus/src/entity/token.entity.dart';
import 'package:reddisney_plus/src/protocols/init.protocol.dart';

class InitInteractor implements IPresenterToIInteractor {

  @override
  IInteractorToPresenter presenter;

  @override
  fetchGrant() {
    var collection = CloudStore.instance.collection("device");

    Map<String, dynamic> request = {
      "deviceFamily": "browser",
      "applicationRuntime": "chrome",
      "deviceProfile": "macosx",
      "attributes": {}
    };

    collection.fetch("createDeviceGrant", request).then((response){
      GrantEntity grant = GrantEntity.fromJson(response);

      print(grant.assertion);

      var collectionToken = CloudStore.instance.collection("token");

      request = {
        "grant_type": "urn:ietf:params:oauth:grant-type:token-exchange",
        "latitude": "0",
        "longitude": "0",
        "platform": "browser",
        "subject_token": grant.assertion,
        "subject_token_type": "urn:bamtech:params:oauth:token-type:device"
      };

      collectionToken.fetch("exchange", request).then((tResponse){
        TokenEntity token = TokenEntity.fromJson(tResponse);
        this.presenter.grantFetchedSuccess(token);
      });

    });

  }

}