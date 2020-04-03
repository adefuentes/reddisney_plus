
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:reddisney_plus/src/extensions/colors.extension.dart';

class SecondPageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: "https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/A602A7AA6E092BBFAD73997E2A5B431565C3A50CB4BC6539E84AEED1143BDA12/scale?format=jpeg",
          errorWidget: (context, url, error) => Icon(Icons.error),
          imageBuilder: (context, imageProvider) => Container(
            height: ((width * 3) * 864) / 1536,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.topCenter
              ),
            ),
          ),
        ),
        Positioned(
          top: 200,
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: width,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(4, 7, 18, 0.0),
                      Color.fromRGBO(4, 7, 18, 0.5),
                      Color.fromRGBO(4, 7, 18, 0.8),
                      Color.fromRGBO(4, 7, 18, 1.0),
                      Color.fromRGBO(4, 7, 18, 1.0),
                      Color.fromRGBO(4, 7, 18, 1.0),
                      Color.fromRGBO(4, 7, 18, 1.0),
                      Color.fromRGBO(4, 7, 18, 1.0),
                      Color.fromRGBO(4, 7, 18, 1.0),
                      Color.fromRGBO(4, 7, 18, 1.0),
                      Color.fromRGBO(4, 7, 18, 1.0),
                      Color.fromRGBO(4, 7, 18, 1.0),
                      Color.fromRGBO(4, 7, 18, 1.0),
                    ]
                  )
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 200),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/disney_plus_logo.png",
                        width: width * 0.5,
                        height: 140,
                      ),
                      Container(
                        width: width * 0.9,
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                          "Las mejores historias del mundo, en un mismo lugar.",
                          textAlign: TextAlign.center,              
                          style: TextStyle(
                            color: HexColor.fromHex("#ffffff"),
                            fontSize: 28,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      Container(
                        width: width * 0.8,
                        padding: EdgeInsets.only(top: 48),
                        child: Image.network(
                          "https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/9EFE39181199C250734D033BB8B1225BD5ED945737DD9986C461DAE7D8D147C2/scale?format=png"
                        )
                      )
                    ],
                  )
                )
              )
            )
          )
        ),
      ],
    );
  }

}