import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reddisney_plus/src/db/cloud_store.dart';
import 'package:reddisney_plus/src/db/globals.dart';
import 'package:reddisney_plus/src/entity/avatars.entity.dart';
import 'package:reddisney_plus/src/entity/grant.entity.dart';
import 'package:reddisney_plus/src/entity/profiles.entity.dart';
import 'package:reddisney_plus/src/entity/token.entity.dart';
import 'package:reddisney_plus/src/protocols/profiles.protocol.dart';

class ProfilesInteractor extends PPresenterToPInteractor {
  
  Future<AvatarsDataEntity> getAvatars(List<ProfileEntity> profiles) async {

    Map<String, List<String>> arg = {
      '\"preferredLanguage\"': ['\"es-ES\"'],
      '\"avatarId\"': profiles.map((ProfileEntity profile) {
        return '\"${profile.attributes.avatar.id}\"';
      }).toList()
    };

    String uri = '$AVATAR_URI?variables=${arg.toString()}';

    var response = await http.get(uri, headers: {
      "authorization": "Bearer ${CloudStore.token}"
    });

    print(response.body);
    var jsonResponse = json.decode(response.body);

    return AvatarsDataEntity.fromJson(jsonResponse["data"]);

  }

  @override
  fetchProfiles() {
    var collection = CloudStore.instance.collection("account");

    collection.fetch("getUserProfiles").then((response) {

      var list = response as List;
      List<ProfileEntity> profiles = list.map((v) => ProfileEntity.fromJson(v)).toList();

      this.getAvatars(profiles).then((avatars) {
        presenter.fetchedProfiles(profiles, avatars);
      });

    });

  }

  @override
  putSelectedProfile(String id) {
    var collection = CloudStore.instance.collection("account");
    
    collection.fetch("setActiveUserProfile", {
      "{profileId}": id
    }).then((response) {
      var grant = GrantEntity.fromJson(response);

      collection = CloudStore.instance.collection("token");

      Map<String, dynamic> request = {
        "grant_type": "urn:ietf:params:oauth:grant-type:token-exchange",
        "latitude": "0",
        "longitude": "0",
        "platform": "browser",
        "subject_token": grant.assertion,
        "subject_token_type": "urn:bamtech:params:oauth:token-type:account"
      };

      collection.fetch("exchange", request).then((tResponse){
        
        var token = TokenEntity.fromJson(tResponse);
        presenter.selectedProfile(token);

      });

    });
  }

}