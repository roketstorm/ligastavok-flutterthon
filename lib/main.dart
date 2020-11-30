import 'package:flutter/material.dart';
import 'package:lsflutterthon/styles.dart';
import 'package:lsflutterthon/widgets/animations/liveIndicator.dart';
import 'package:lsflutterthon/widgets/greenContainer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Liga Stavok Flutterthon'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: CLASSICPADDING,
        child: Column(
          children: <Widget>[GreenContainer(), LiveIndicator()],
        ),
      ),
    );
  }
}
