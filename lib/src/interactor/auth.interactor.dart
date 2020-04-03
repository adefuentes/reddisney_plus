import 'package:reddisney_plus/src/db/cloud_store.dart';
import 'package:reddisney_plus/src/entity/check.entity.dart';
import 'package:reddisney_plus/src/entity/grant.entity.dart';
import 'package:reddisney_plus/src/entity/login.entity.dart';
import 'package:reddisney_plus/src/entity/token.entity.dart';
import 'package:reddisney_plus/src/protocols/auth.protocol.dart';

class AuthInteractor extends APresenterToAInteractor {

  final CollectionReference collection = CloudStore.instance.collection("bamIdentity");

  @override
  fetchEmail(String email) {

    Map<String, dynamic> request = {
      "email": email,
    };

    collection.fetch("check", request).then((response) {
      print("THEN CHECK");
      CheckEntity check = CheckEntity.fromJson(response);
      if (check.operations.first == "Login") {
        presenter.emailFetchedSuccess();
      } else {
        presenter.emailFetchedFailed();
      }

    });
  }

  @override
  fetchAuth(String email, String pass) {

    Map<String, dynamic> request = {
      "email": email,
      "password": pass
    };

    collection.fetch("identityLogin", request).then((response) {

      print("THEN LOGIN");

      LoginEntity loginEntity = LoginEntity.fromJson(response);
      request = {
        "id_token": loginEntity.idToken
      };

      var accountCollection = CloudStore.instance.collection("account");
      accountCollection.fetch("createAccountGrant", request).then((grantResponse) {
        print("THEN GRANT");
        GrantEntity grantEntity = GrantEntity.fromJson(grantResponse);
        var tokenCollection = CloudStore.instance.collection("token");

        request = {
          "grant_type": "urn:ietf:params:oauth:grant-type:token-exchange",
          "latitude": "0",
          "longitude": "0",
          "platform": "browser",
          "subject_token": grantEntity.assertion,
          "subject_token_type": "urn:bamtech:params:oauth:token-type:account"
        };

        tokenCollection.fetch("exchange", request).then((tokenResponse) {
          print("THEN TOKEN");
          TokenEntity tokenEntity = TokenEntity.fromJson(tokenResponse);
          presenter.authFetchedSuccess(tokenEntity);
          
        });
      });
    });
  }

}