import 'package:flutter/material.dart';

abstract class Head2HeadEvent {
  const Head2HeadEvent();
}

class Head2HeadRequested extends Head2HeadEvent {
  final String team1;
  final String team2;

  // Единственное событие инициации запроса клиентом
  const Head2HeadRequested({@required this.team1, @required this.team2})
      : assert(team1 != null, team2 != null);
}
