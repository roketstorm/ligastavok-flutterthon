import 'package:flutter/material.dart';
import 'package:lsflutterthon/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lsflutterthon/widgets/animations/loadingFaceWidget.dart';

class GreenContainerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Opacity(
                  opacity: 0.2,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://www.thesportsdb.com/images/media/team/badge/vvtsyu1455465317.png",
                    placeholder: (context, url) =>
                        Center(child: LoadingFaceWidget()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Expanded(
                child: Opacity(
                  opacity: 0.2,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://www.thesportsdb.com/images/media/team/badge/obs41m1574507346.png",
                    placeholder: (context, url) =>
                        Center(child: LoadingFaceWidget()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "CROATIA",
                    style: HEADER,
                  ),
                  Text(
                    "SPAIN",
                    style: HEADER,
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "2018",
                            style: HEADERYEAR,
                          ),
                        ),
                        Container(
                          child: Text(
                            "2 - 0",
                            style: HEADERPOINTS,
                          ),
                        ),
                        Divider(
                          color: GRAY40,
                          height: 4.0,
                        ),
                        Container(
                          child: Text(
                            "2019",
                            style: HEADERYEAR,
                          ),
                        ),
                        Container(
                          child: Text(
                            "0 - 1",
                            style: HEADERPOINTS,
                          ),
                        ),
                        Divider(
                          color: GRAY40,
                          height: 4.0,
                        ),
                        Container(
                          child: Text(
                            "2020",
                            style: HEADERYEAR,
                          ),
                        ),
                        Container(
                          child: Text(
                            "5 - 2",
                            style: HEADERPOINTS,
                          ),
                        ),
                        Divider(
                          color: GRAY40,
                          height: 4.0,
                        ),
                        Container(
                          child: Text(
                            "2021",
                            style: HEADERYEAR,
                          ),
                        ),
                        Container(
                          child: Text(
                            "3 - 1",
                            style: HEADERPOINTS,
                          ),
                        ),
                        Divider(
                          color: GRAY40,
                          height: 4.0,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
