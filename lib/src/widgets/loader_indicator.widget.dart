import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderIndicator extends StatelessWidget {

  final double width;
  final double height;

  LoaderIndicator({Key key, this.width, this.height}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Center(
        child: Stack(
          children: <Widget>[
            SpinKitRipple(
              color: Colors.white,
              size: 150.0
            ),
            Center(
              child: Image.asset(
                "assets/images/mickey_icon.png",
                color: Colors.white,
                width: 50,
                height: 50,
              )
            )
          ],
        ),
      ),
    );
  }
}