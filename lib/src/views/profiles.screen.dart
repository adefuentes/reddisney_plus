
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddisney_plus/src/entity/avatars.entity.dart';
import 'package:reddisney_plus/src/entity/profiles.entity.dart';
import 'package:reddisney_plus/src/extensions/colors.extension.dart';
import 'package:reddisney_plus/src/presenter/profiles.presenter.dart';
import 'package:reddisney_plus/src/protocols/profiles.protocol.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ProfilesScreen extends StatelessWidget {

  final ProfilesPresenter presenter;

  ProfilesScreen({Key key, this.presenter}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: ProfilesPage(presenter: presenter),
    );
  }

}

class ProfilesPage extends StatefulWidget {

  final ProfilesPresenter presenter;

  ProfilesPage({Key key, this.presenter}): super(key: key);

  @override
  State<StatefulWidget> createState() => presenter.view;

}

class ProfilesPageState extends State<ProfilesPage> implements PPresenterToPView {

  List<ProfileEntity> profiles = [];
  List<String> listHeader = ["¿Quién eres?"];
  AvatarsDataEntity avatars;

  @override
  void initState() {
    super.initState();

    widget.presenter.getProfiles();

  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.transparent,
        middle: Container(
          color: Colors.transparent,
          child: Image.asset(
            "assets/images/disney_plus_logo.png",
          )
        )
      ),
      backgroundColor: DisneyColors.bg,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
        child: new ListView.builder(
          itemCount: listHeader.length, 
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return StickyHeader(
              header: Container(
                alignment: Alignment.topCenter,
                height: 80.0,
                child: Text(
                  listHeader[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              content: Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: profiles.length,
                  itemBuilder: (BuildContext context, int index) {
                    String avatarImg = "";

                    avatars.avatars.forEach((avatar) {
                      if (profiles[index].attributes.avatar.id == avatar.avatarId){
                        avatarImg = avatar.images[0].url;
                      }
                    });

                    return ProfileButton(
                      avatar: avatarImg,
                      name: profiles[index].profileName,
                      onSelect: (){
                        widget.presenter.selectProfile(profiles[index].profileId);
                      },
                    );
                  },
                ),
              )
            );
          }
        )
      )
    );
  }

  @override
  profilesFetchedSuccess(List<ProfileEntity> profiles, AvatarsDataEntity avatars) {
    setState(() {
      this.profiles = profiles;
      this.avatars = avatars;
    });
  }

}

class ProfileButton extends StatelessWidget {

  final String avatar;
  final String name;
  final VoidCallback onSelect;

  const ProfileButton({Key key, this.avatar, this.name, this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: new EdgeInsets.only(top: 16.0),
            width: 104,
            height: 104,
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                    offset: Offset(
                      0.0,
                      5.0,
                    ),
                  )
                ],
                shape: BoxShape.circle
              ),
              child: GestureDetector(
                onTap: onSelect,
                child: Image.network(
                  avatar,
                  height: 10.0,
                  width: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w300
              ),
            )
          )
        ]
      )
    );
  }

}