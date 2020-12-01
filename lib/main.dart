import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsflutterthon/blocs/head2head_bloc.dart';
import 'package:lsflutterthon/blocs/head2head_event.dart';
import 'package:lsflutterthon/repositories/head2head_api_client.dart';
import 'package:lsflutterthon/repositories/head2head_repository.dart';
import 'package:lsflutterthon/styles.dart';
import 'package:lsflutterthon/widgets/animations/liveIndicator.dart';
import 'package:lsflutterthon/widgets/green_container.dart';
import 'package:http/http.dart' as http;

void main() {
  final Head2HeadRepository head2headRepository = Head2HeadRepository(
      client: Head2HeadApiClient(httpClient: http.Client()));

  runApp(MyApp(
    repository: head2headRepository,
  ));
}

class MyApp extends StatelessWidget {
  final Head2HeadRepository repository;

  MyApp({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
          create: (context) => Head2HeadBloc(head2headRepository: repository),
          child: MyHomePage(title: 'Liga Stavok Flutterthon')),
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
    BlocProvider.of<Head2HeadBloc>(context).add(Head2HeadRequested(
        team1: 'sr:competitor:4715', team2: 'sr:competitor:4698'));
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
          children: <Widget>[GreenContainer(), LiveIndicator()],
        ),
      ),
    );
  }
}
