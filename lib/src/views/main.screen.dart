
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddisney_plus/src/extensions/colors.extension.dart';

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: MainPage(),
    );
  }

}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }

}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.black.withOpacity(0.3),
        activeColor: Colors.blueGrey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text(
              "Inicio"
            ),
            icon: Image.asset(
              "assets/images/home.png",
              height: 25,
              color: Colors.white38,
            ),
            activeIcon: Image.asset(
              "assets/images/home-filled.png",
              height: 25,
              fit: BoxFit.contain,
              color: Colors.blueGrey,
            )
          ),
          BottomNavigationBarItem(
            title: Text(
              "Búsqueda"
            ),
            icon: Image.asset(
              "assets/images/search.png",
              height: 25,
              color: Colors.white38,
            ),
            activeIcon: Image.asset(
              "assets/images/search-filled.png",
              height: 25,
              fit: BoxFit.contain,
              color: Colors.blueGrey,
            )
          ),
          BottomNavigationBarItem(
            title: Text(
              "Mis descargas"
            ),
            icon: Image.asset(
              "assets/images/download.png",
              height: 25,
              color: Colors.white38,
            ),
            activeIcon: Image.asset(
              "assets/images/download.png",
              height: 25,
              fit: BoxFit.contain,
              color: Colors.blueGrey,
            )
          ),
          BottomNavigationBarItem(
            title: Text(
              "Mi lista"
            ),
            icon: Image.asset(
              "assets/images/list.png",
              height: 25,
              color: Colors.white38,
            ),
            activeIcon: Image.asset(
              "assets/images/list-filled.png",
              height: 25,
              fit: BoxFit.contain,
              color: Colors.blueGrey,
            )
          ),
          BottomNavigationBarItem(
            title: Text(
              "Perfil"
            ),
            icon: Image.asset(
              "assets/images/profile.png",
              height: 25,
              color: Colors.white38,
            ),
            activeIcon: Image.asset(
              "assets/images/profile-filled.png",
              height: 25,
              fit: BoxFit.contain,
              color: Colors.blueGrey,
            )
          )
        ],
      ),
      tabBuilder: (BuildContext context, int index){
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              backgroundColor: DisneyColors.darkBg,
              navigationBar: CupertinoNavigationBar(
                backgroundColor: Colors.transparent,
                middle: Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    "assets/images/disney_plus_logo.png",
                  )
                )
              ),
              child: Center(),
            );
          }
        );
      },
    );
  }
}

