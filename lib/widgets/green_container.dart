import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsflutterthon/blocs/head2head_bloc.dart';
import 'package:lsflutterthon/blocs/head2head_event.dart';
import 'package:lsflutterthon/blocs/head2head_state.dart';
import 'package:lsflutterthon/settings.dart';
import 'package:lsflutterthon/styles.dart';
import 'package:lsflutterthon/widgets/animations/loadingFaceWidget.dart';
import 'package:lsflutterthon/widgets/green_container_content.dart';

// Родительский контейнер (Обработка событий из Head2HeadBloc)
class GreenContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<Head2HeadBloc>(context).add(Head2HeadRequested(
        team1: TEAM1, team2: TEAM2)); // Запуск состояния загрузки
    return Container(
      width: MediaQuery.of(context).size.width - 32.0,
      height: MediaQuery.of(context).size.height / 3.0, // 30% экрана, как по ТЗ
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [GREENDARK, GRAY85]),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child:
          BlocBuilder<Head2HeadBloc, Head2HeadState>(builder: (context, state) {
        // Проверка состояний и отображение соответствующего виджета
        if (state is Head2HeadInitial) {
          return LoadingFaceWidget();
        }
        if (state is Head2HeadLoadInProgress) {
          return LoadingFaceWidget();
        }
        if (state is Head2HeadLoadSuccess) {
          final head2head = state.head2head;
          return GreenContainerContent(head2head);
        }
        if (state is Head2HeadLoadFailure) {
          return Center(
            child: Text(
              "Упс! Проверьте соединение с сетью Интернет! :)",
              style: HEADER,
              textAlign: TextAlign.center,
            ),
          );
        }
        return Center(
          child: Text(
            "Упс! Хьюстон, попробуй перезапустить страницу! :)",
            style: HEADER,
            textAlign: TextAlign.center,
          ),
        );
      }),
    );
  }
}
