
import 'package:flutter/cupertino.dart';
import 'package:reddisney_plus/src/db/cloud_store.dart';
import 'package:reddisney_plus/src/extensions/colors.extension.dart';
import 'package:reddisney_plus/src/presenter/zero.presenter.dart';
import 'package:reddisney_plus/src/protocols/zero.protocol.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ZeroScreen extends StatelessWidget implements ZPresenterToZView {

  final Future<SharedPreferences> _shared = SharedPreferences.getInstance();
  final ZeroPresenter presenter;

  ZeroScreen({this.presenter});

  @override
  Widget build(BuildContext context) {

    presenter.context = context;

    CloudStore.instance.loadManifest().then((_){
      _shared.then((prefs){
        String refreshToken = prefs.getString("refreshToken");

        if(refreshToken == null) {
          presenter.showInitController();
        } else {
          presenter.startFetchingToken(refreshToken);
        }

      });
    });

    return CupertinoPageScaffold(
      backgroundColor: DisneyColors.darkBg, 
      child: Center(),
    );
  }

  @override
  error() {
    presenter.showInitController();
  }

  @override
  success() {
    presenter.showProfilesController();
  }
  
}