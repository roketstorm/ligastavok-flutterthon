import 'package:flutter/material.dart';
import 'package:lsflutterthon/styles.dart';
import 'package:lsflutterthon/widgets/animations/loadingFaceWidget.dart';

class GreenContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32.0,
      height: MediaQuery.of(context).size.height / 3.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [GREENDARK, GRAY85]
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: LoadingFaceWidget(),
    );
  }

}