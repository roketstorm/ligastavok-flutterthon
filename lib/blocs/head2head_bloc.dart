import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsflutterthon/blocs/head2head_event.dart';
import 'package:lsflutterthon/blocs/head2head_state.dart';
import 'package:lsflutterthon/models/head2head.dart';
import 'package:lsflutterthon/repositories/head2head_repository.dart';

class Head2HeadBloc extends Bloc<Head2HeadEvent, Head2HeadState> {
  final Head2HeadRepository head2headRepository;

  Head2HeadBloc({@required this.head2headRepository})
      : assert(head2headRepository != null),
        super(Head2HeadInitial());

  @override
  Stream<Head2HeadState> mapEventToState(Head2HeadEvent event) async* {
    if (event is Head2HeadRequested) {
      yield Head2HeadLoadInProgress();
      try {
        final Head2Head head2head = await head2headRepository.getInfo(event.team1, event.team2);
        yield Head2HeadLoadSuccess(head2head: head2head);
      } catch (e) {
        log(e);
        yield Head2HeadLoadFailure();
      }
    }
  }
}
