import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddisney_plus/src/extensions/colors.extension.dart';
import 'package:reddisney_plus/src/pages/auth_view.page.dart';
import 'package:reddisney_plus/src/presenter/auth.presenter.dart';
import 'package:reddisney_plus/src/protocols/auth.protocol.dart';
import 'package:reddisney_plus/src/widgets/loader_indicator.widget.dart';

class AuthScreen extends StatelessWidget {

  final AuthPresenter presenter;

  const AuthScreen({Key key, this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: AuthPage(presenter: presenter),
      title: 'Iniciar sesión',
      theme: CupertinoThemeData(
        brightness: Brightness.light
      ),
    );
  }

}

class AuthPage extends StatefulWidget {
  
  final AuthPresenter presenter;

  AuthPage({Key key, this.presenter}) : super(key: key);

  @override
  AuthPageState createState() => presenter.view;

}

class AuthPageState extends State<AuthPage> implements APresenterToAView {

  int indexPage = 0;
  String email;
  String pass;
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passFocus = FocusNode();

  final _controller = PageController(
    initialPage: 0
  );

  actionLaunch() {
    indexPage += 1;
    setState(() {
      indexPage = indexPage;
    });
    _controller.animateToPage(
      indexPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease
    );
    widget.presenter.auth(email, pass);
  }
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.transparent,
        middle: indexPage > 1 ? (
          Container(
            color: Colors.transparent,
            child: Image.asset(
              "assets/images/disney_plus_logo.png",
            )
          )
        ) : null,
        leading: indexPage < 1 ? (
          Container(
            color: Colors.transparent,
            child: Image.asset(
              "assets/images/disney_plus_logo.png",
            )
          )
        ) : null,
        trailing: indexPage == 0 ? (
          GestureDetector(
            onTap: () {
              widget.presenter.fetchEmail(this.email);
            },
            child: Text(
              "Siguiente",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          )
        ) : (
          indexPage == 1 ? (
            GestureDetector(
              onTap: this.actionLaunch,
              child: Text(
                "Iniciar sesión",
                style: TextStyle(
                  //color: Color.fromRGBO(0, 114, 210, 1)
                  color: Colors.white
                ),
              ),
            )
          ) : null
        )
      ),
      backgroundColor: DisneyColors.bg,
      child: PageView(
        controller: _controller,
        physics: new NeverScrollableScrollPhysics(),
        children: <Widget>[
          AuthPageView(
            inputType: TextInputType.emailAddress,
            obscureText: false,
            placeholder: "Escribe tu email",
            title: "Introduce tu email",
            inputAction: TextInputAction.go,
            onSubmitted: null,
            focusNode: _emailFocus,
            onEditingComplete: () {
              widget.presenter.fetchEmail(this.email);
            },
            onValueChanged: (value) {
              email = value;
            },
          ),
          AuthPageView(
            inputType: TextInputType.visiblePassword,
            obscureText: true,
            inputAction: TextInputAction.done,
            placeholder: "Escribe tu contraseña",
            title: "Introduce tu contraseña",
            focusNode: _passFocus,
            onEditingComplete: this.actionLaunch,
            onValueChanged: (value) {
              pass = value;
            },
          ),
          Center(
            child: LoaderIndicator(
              width: 200,
              height: 200,
            ),
          )
        ],
      )
    );
  }

  @override
  successEmail() {
    indexPage += 1;
    _controller.animateToPage(
      indexPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease
    ).then((_) {
      _emailFocus.unfocus();
      FocusScope.of(context).requestFocus(_passFocus);
    });

  }

  @override
  successAuth() {
    print("LLEGO!!");
    widget.presenter.showMainController();
  }

  @override
  wrongEmail() {}

  @override
  wrongAuth() {}

}