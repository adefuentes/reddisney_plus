import 'package:flutter/material.dart';
import 'package:reddisney_plus/src/entity/avatars.entity.dart';
import 'package:reddisney_plus/src/entity/profiles.entity.dart';
import 'package:reddisney_plus/src/entity/token.entity.dart';
import 'package:reddisney_plus/src/protocols/base.protocol.dart';
import 'package:reddisney_plus/src/views/profiles.screen.dart';

abstract class PViewToPPresenter extends BaseProtocol <
  ProfilesPageState,
  PPresenterToPInteractor,
  PPresenterToPRouter
> {
  getProfiles();
  selectProfile(String id);
}

abstract class PPresenterToPView {
  profilesFetchedSuccess(List<ProfileEntity> profiles, AvatarsDataEntity avatars);
}

abstract class PPresenterToPRouter {
  pushToMainView(BuildContext context);
}

abstract class PPresenterToPInteractor {
  PInteractorToPPresenter presenter;
  fetchProfiles();
  putSelectedProfile(String id);
}

abstract class PInteractorToPPresenter { 
  fetchedProfiles(List<ProfileEntity> profiles, AvatarsDataEntity avatars);
  selectedProfile(TokenEntity token);
}