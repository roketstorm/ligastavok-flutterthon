import 'package:lsflutterthon/models/sport_event.dart';
import 'package:lsflutterthon/models/team.dart';

class Head2Head {
  final Team team1;
  final Team team2;
  final List<SportEvent> sportEvents;

  Head2Head({this.team1, this.team2, this.sportEvents});

  static Head2Head fromJson(dynamic json) {
    List<SportEvent> events = List<SportEvent>();

    // Генерация списка событий
    json['last_meetings']['results'].forEach((elem) => events.add(SportEvent(
        scheduled: DateTime.parse(elem['sport_event']['scheduled']),
        awayScore: elem['sport_event_status']['away_score'],
        homeScore: elem['sport_event_status']['home_score'],
        winnerId: elem['sport_event_status']['winner_id'],
        matchStatus: elem['sport_event_status']['match_status'])));

    return Head2Head(
        team1: Team(
            id: json['teams'][0]['id'],
            name: json['teams'][0]['name'],
            country: json['teams'][0]['country'],
            countryCode: json['teams'][0]['country_code'],
            abbreviation: json['teams'][0]['abbreviation']),
        team2: Team(
            id: json['teams'][1]['id'],
            name: json['teams'][1]['name'],
            country: json['teams'][1]['country'],
            countryCode: json['teams'][1]['country_code'],
            abbreviation: json['teams'][1]['abbreviation']),
        sportEvents: events);
  }
}
