import 'package:flutter/material.dart';
import 'package:lsflutterthon/styles.dart';

// Идикатор "В прямом в эфире" с анимацией
class LiveIndicator extends StatefulWidget {
  @override
  _LiveIndicatorState createState() => _LiveIndicatorState();
}

class _LiveIndicatorState extends State<LiveIndicator> with SingleTickerProviderStateMixin {
  AnimationController _transparencyController;
  Animation<double> _animation;

  @override
  void initState() {
    _transparencyController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _transparencyController.repeat(min: 0.3, max: 1.0, reverse: true);
    _animation = CurvedAnimation(parent: _transparencyController, curve: Curves.ease);
    super.initState();
  }

  @override
  void dispose() {
    _transparencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
          child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: ORANGE
        ),
        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
        child: Text("LIVE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),),
      ),
    );
  }
}