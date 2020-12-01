import 'package:http/http.dart';
import 'package:lsflutterthon/models/head2head.dart';
import 'package:flutter/material.dart';

abstract class Head2HeadState {
  const Head2HeadState();
}

class Head2HeadInitial extends Head2HeadState {}

class Head2HeadLoadInProgress extends Head2HeadState {}

class Head2HeadLoadSuccess extends Head2HeadState {
  final Head2Head head2head;

  const Head2HeadLoadSuccess({ @required this.head2head }) : assert(head2head != null);
}

class Head2HeadLoadFailure extends Head2HeadState {}