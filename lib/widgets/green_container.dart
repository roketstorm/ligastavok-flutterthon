import 'package:flutter/material.dart';
import 'package:lsflutterthon/styles.dart';
import 'package:lsflutterthon/widgets/green_container_content.dart';

class GreenContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [GREENDARK, GRAY85]
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: Column(
        children: [
          //LoadingFaceWidget(),
          GreenContainerContent()
        ],
      ),
    );
  }

}