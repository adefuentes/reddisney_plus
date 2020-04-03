
import 'package:flutter/cupertino.dart';
import 'package:reddisney_plus/src/db/cloud_store.dart';
import 'package:reddisney_plus/src/entity/avatars.entity.dart';
import 'package:reddisney_plus/src/entity/profiles.entity.dart';
import 'package:reddisney_plus/src/entity/token.entity.dart';
import 'package:reddisney_plus/src/protocols/profiles.protocol.dart';
import 'package:reddisney_plus/src/views/profiles.screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfilesPresenter implements PViewToPPresenter, PInteractorToPPresenter {

  Future<SharedPreferences> _shared = SharedPreferences.getInstance();
  BuildContext context;

  @override
  PPresenterToPInteractor interactor;

  @override
  PPresenterToPRouter router;

  @override
  ProfilesPageState view;

  @override
  getProfiles() {
    interactor.fetchProfiles();
  }

  @override
  selectProfile(String id) {
    interactor.putSelectedProfile(id);
  }

  @override
  fetchedProfiles(List<ProfileEntity> profiles, AvatarsDataEntity avatars) {
    view.profilesFetchedSuccess(profiles, avatars);
  }

  @override
  selectedProfile(TokenEntity token) {
    CloudStore.token = token.accessToken;
    CloudStore.refreshToken = token.refreshToken;
    _shared.then((prefs) {
      prefs.setString("refreshToken", token.refreshToken);
      router.pushToMainView(context);
    });
  }

}