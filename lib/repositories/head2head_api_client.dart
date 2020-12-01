import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lsflutterthon/models/head2head.dart';
import 'package:lsflutterthon/settings.dart';
import 'package:meta/meta.dart';

class Head2HeadApiClient {
  static const baseUrl = 'https://api.sportradar.us/soccer-xt3/intl';
  static const languageCode = 'ru';
  static const format = '.json';

  final http.Client httpClient;

  Head2HeadApiClient(
      {@required this.httpClient})
      : assert(httpClient != null);

  Future<Head2Head> getHead2Head({@required teamId, @required teamId2}) async {
    final url =
        "$baseUrl/$languageCode/teams/$teamId/versus/$teamId2/matches$format?api_key=$APIKEY";
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error getting info');
    }

    final h2hJson = jsonDecode(response.body);
    return Head2Head.fromJson(h2hJson);
  }

  Future<String> getTeamLogo(String name) async {
    final url =
        "/?country=$name";
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error getting info');
    }

    final teamJson = jsonDecode(response.body);
    return teamJson['imglogo'];
  }
}
