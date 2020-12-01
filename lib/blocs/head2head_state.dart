import 'package:lsflutterthon/models/head2head.dart';
import 'package:flutter/material.dart';

abstract class Head2HeadState {
  const Head2HeadState();
}

// Изначальное состояние
class Head2HeadInitial extends Head2HeadState {}

// Состояние прогресса загрузки данных
class Head2HeadLoadInProgress extends Head2HeadState {}

// Состояние успешной загрузки данных и их передача
class Head2HeadLoadSuccess extends Head2HeadState {
  final Head2Head head2head;

  const Head2HeadLoadSuccess({ @required this.head2head }) : assert(head2head != null);
}

// Состояние ошибки загрузки
class Head2HeadLoadFailure extends Head2HeadState {}