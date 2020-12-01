import 'package:flutter/material.dart';
import 'package:lsflutterthon/models/head2head.dart';
import 'package:lsflutterthon/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lsflutterthon/widgets/animations/loadingFaceWidget.dart';

class GreenContainerContent extends StatelessWidget {
  final Head2Head data;

  GreenContainerContent(this.data);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Opacity(
                  opacity: 0.2,
                  child: CachedNetworkImage(
                    imageUrl: data.team1.imageUrl,
                    placeholder: (context, url) =>
                        Center(child: LoadingFaceWidget()),
                    errorWidget: (context, url, error) => Icon(
                      Icons.group,
                      color: Colors.white,
                      size: 64.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Opacity(
                  opacity: 0.2,
                  child: CachedNetworkImage(
                    imageUrl: data.team2.imageUrl,
                    placeholder: (context, url) =>
                        Center(child: LoadingFaceWidget()),
                    errorWidget: (context, url, error) => Icon(
                      Icons.group,
                      color: Colors.white,
                      size: 64.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(data.team1.name.toUpperCase(),
                        style: HEADER,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.center,
                        maxLines: 2),
                  ),
                  Expanded(
                    child: Text(data.team2.name.toUpperCase(),
                        style: HEADER,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 2),
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
