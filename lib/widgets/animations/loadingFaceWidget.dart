import 'package:flutter/material.dart';

class LoadingFaceWidget extends StatefulWidget {
  @override
  _LoadingFaceWidgetState createState() => _LoadingFaceWidgetState();
}

class _LoadingFaceWidgetState extends State<LoadingFaceWidget> with SingleTickerProviderStateMixin {
  AnimationController _rotationController;

  @override
  void initState() {
    _rotationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _rotationController.repeat(min: 0.0, max: 1.0);
    super.initState();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(_rotationController),
        child: Icon(Icons.sports_soccer, color: Colors.white, size: 48.0));
  }
}
