import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsflutterthon/blocs/head2head_bloc.dart';
import 'package:lsflutterthon/repositories/head2head_api_client.dart';
import 'package:lsflutterthon/repositories/head2head_repository.dart';
import 'package:lsflutterthon/styles.dart';
import 'package:lsflutterthon/widgets/green_container.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: CLASSICPADDING,
        child: Column(
          children: <Widget>[
            // Создание Head2HeadBloc в текущем контексте
            BlocProvider<Head2HeadBloc>(
                create: (context) => Head2HeadBloc(
                    head2headRepository: Head2HeadRepository(
                        client: Head2HeadApiClient(httpClient: http.Client()))),
                child: GreenContainer())
          ],
        ),
      ),
    );
  }
}
