import 'package:flutter/material.dart';
import 'package:lsflutterthon/styles.dart';

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
              Opacity(
                opacity: 0.2,
                child: Image.network(
                  "https://www.thesportsdb.com/images/media/team/badge/vvtsyu1455465317.png",
                  width: MediaQuery.of(context).size.width / 2.3,
                ),
              ),
              Opacity(
                opacity: 0.2,
                child: Image.network(
                  "https://www.thesportsdb.com/images/media/team/badge/obs41m1574507346.png",
                  width: MediaQuery.of(context).size.width / 2.3,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ],
          ),
        )
      ],
    );
  }
}
