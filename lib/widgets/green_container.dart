import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsflutterthon/blocs/head2head_bloc.dart';
import 'package:lsflutterthon/blocs/head2head_event.dart';
import 'package:lsflutterthon/blocs/head2head_state.dart';
import 'package:lsflutterthon/styles.dart';
import 'package:lsflutterthon/widgets/animations/loadingFaceWidget.dart';
import 'package:lsflutterthon/widgets/green_container_content.dart';

class GreenContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<Head2HeadBloc>(context).add(Head2HeadRequested(
        team1: 'sr:competitor:4715', team2: 'sr:competitor:4698'));
    return Container(
      width: MediaQuery.of(context).size.width - 32.0,
      height: MediaQuery.of(context).size.height / 3.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [GREENDARK, GRAY85]),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child:
          BlocBuilder<Head2HeadBloc, Head2HeadState>(builder: (context, state) {
        if (state is Head2HeadInitial) {
          return Text("Initial State");
        }
        if (state is Head2HeadLoadInProgress) {
          return LoadingFaceWidget();
        }
        if (state is Head2HeadLoadSuccess) {
          final head2head = state.head2head;
          return GreenContainerContent();
        }
        if (state is Head2HeadLoadFailure) {
          return Text("Failure State");
        }
      }),
    );
  }
}
