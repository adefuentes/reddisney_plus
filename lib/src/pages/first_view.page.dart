import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:reddisney_plus/src/extensions/colors.extension.dart';

class FirstPageView extends StatelessWidget {

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
                  alignment: Alignment.topLeft
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
                      Container(
                        width: width * 0.9,
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                          "Nuevos Disney+ Originals cada mes",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: HexColor.fromHex("#ffffff"),
                            fontSize: 34,
                            fontWeight: FontWeight.w700
                          ),
                        )
                      ),
                      Container(
                        width: width * 0.9,
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                          "Puedes ver nuevos contenidos, series, cortos y mucho más de los mejores creadores de historias. Solo disponible en Disney+.",
                          textAlign: TextAlign.center,              
                          style: TextStyle(
                            color: HexColor.fromHex("#ffffff"),
                            fontSize: 16,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      Container(
                        width: width * 1.2,
                        padding: EdgeInsets.only(top: 24),
                        child: Image.network(
                          "https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/E548FA3AF0CA77347A0AA51DB2152A5C40BDB80E24A05B69522F920E09F5BD00/scale?width=1200&format=jpeg",
                          fit: BoxFit.contain,
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