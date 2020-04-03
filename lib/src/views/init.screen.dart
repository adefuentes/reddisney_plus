import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:reddisney_plus/src/pages/first_view.page.dart';
import 'package:reddisney_plus/src/pages/third_view.page.dart';
import 'package:reddisney_plus/src/pages/second_view.page.dart';
import 'package:reddisney_plus/src/protocols/init.protocol.dart';
import 'package:reddisney_plus/src/presenter/init.presenter.dart';
import 'package:reddisney_plus/src/extensions/colors.extension.dart';
import 'package:reddisney_plus/src/widgets/dots_indicator.widget.dart';

class InitScreen extends StatelessWidget {

  final InitPresenter presenter;

  InitScreen({this.presenter});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: InitPage(presenter: presenter),
      theme: CupertinoThemeData(
        brightness: Brightness.light
      )
    );
  }

}

class InitPage extends StatefulWidget {
  
  final InitPresenter presenter;

  InitPage({Key key, this.presenter}) : super(key: key);

  @override
  _InitPageState createState() {
    return _InitPageState();

  }

}

class _InitPageState extends State<InitPage> implements IPresenterToIView {

  final _controller = PageController(
    initialPage: 1
  );

  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  final List<Widget> _pages = <Widget>[
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new FirstPageView(),
    ),
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new SecondPageView(),
    ),
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new ThirdPageView(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    widget.presenter.startFetchingGrant();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: HexColor.fromHex('#040712'),
      bottomNavigationBar: InkWell(
        onTap: () => widget.presenter.showAuthController(),
        child: SizedBox(
          height: 100,
          width: width,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: DisneyColors.disneyGradient,
                begin: Alignment.bottomLeft,
                end: Alignment.topRight
              )
            ),
            child: Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Iniciar sesión',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _controller,
            children: _pages,
          ),
          Positioned(
            top: 48.0,
            left: 0.0,
            right: 0.0,
            child: new Container(
              padding: const EdgeInsets.all(20.0),
              child: new Center(
                child: new DotsIndicator(
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageSelected: (int page) {
                    _controller.animateToPage(
                      page,
                      duration: _kDuration,
                      curve: _kCurve,
                    );
                  },
                ),
              ),
            )
          )
        ]
      ),
    );
  }

  @override
  showError() {
  }

}