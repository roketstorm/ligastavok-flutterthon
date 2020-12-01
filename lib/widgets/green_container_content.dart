import 'package:flutter/material.dart';
import 'package:lsflutterthon/models/head2head.dart';
import 'package:lsflutterthon/models/sport_event.dart';
import 'package:lsflutterthon/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lsflutterthon/widgets/animations/loadingFaceWidget.dart';

// Контентная область контейнера (получение данных из Head2HeadBloc)
class GreenContainerContent extends StatelessWidget {
  final Head2Head data;

  GreenContainerContent(this.data);

  List<Widget> generateScoreTable(List<SportEvent> events) {
    List<Widget> sortedEvents = List<Widget>();

    events.sort((a, b) => b.scheduled.compareTo(a.scheduled));

    events.forEach((element) {
      sortedEvents.add(
        Container(
          child: Text(
            "${element.scheduled.day}.${element.scheduled.month}.${element.scheduled.year}",
            style: HEADERYEAR,
          ),
        ),
      );
      if (element.homeScore > element.awayScore) {
        if (element.winnerId == data.team1.id) {
          sortedEvents.add(
            Container(
              child: Text(
                "${element.homeScore} - ${element.awayScore}",
                style: HEADERPOINTS,
              ),
            ),
          );
        } else {
          sortedEvents.add(
            Container(
              child: Text(
                "${element.awayScore} - ${element.homeScore}",
                style: HEADERPOINTS,
              ),
            ),
          );
        }
      } else {
        if (element.winnerId == data.team1.id) {
          sortedEvents.add(
            Container(
              child: Text(
                "${element.homeScore} - ${element.awayScore}",
                style: HEADERPOINTS,
              ),
            ),
          );
        } else {
          sortedEvents.add(
            Container(
              child: Text(
                "${element.awayScore} - ${element.homeScore}",
                style: HEADERPOINTS,
              ),
            ),
          );
        }
      }
      sortedEvents.add(
        Divider(
          color: GRAY40,
          height: 4.0,
        ),
      );
    });

    return sortedEvents;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Opacity(
                  opacity: 0.2,
                  child: data.team2.imageUrl == 'none'
                      ? Icon(
                          Icons.group,
                          color: Colors.white,
                          size: 64.0,
                        )
                      : CachedNetworkImage(
                          imageUrl: data.team1.imageUrl,
                          placeholder: (context, url) =>
                              Center(child: LoadingFaceWidget()),
                          errorWidget: (context, url, error) => Icon(
                            Icons.group,
                            color: Colors.white,
                            size: 64.0,
                          ),
                        ),
                ),
              ),
              Expanded(
                child: Opacity(
                  opacity: 0.2,
                  child: data.team2.imageUrl == 'none'
                      ? Icon(
                          Icons.group,
                          color: Colors.white,
                          size: 64.0,
                        )
                      : CachedNetworkImage(
                          imageUrl: data.team2.imageUrl,
                          placeholder: (context, url) =>
                              Center(child: LoadingFaceWidget()),
                          errorWidget: (context, url, error) => Icon(
                            Icons.group,
                            color: Colors.white,
                            size: 64.0,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(data.team1.name.toUpperCase(),
                        style: HEADER,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.center,
                        maxLines: 2),
                  ),
                  Expanded(
                    child: Text(data.team2.name.toUpperCase(),
                        style: HEADER,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 2),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      children: [...generateScoreTable(data.sportEvents)],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
