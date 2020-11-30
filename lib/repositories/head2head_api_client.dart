import 'package:http/http.dart' as http;
import 'package:lsflutterthon/models/head2head.dart';
import 'package:lsflutterthon/settings.dart';
import 'package:meta/meta.dart';

class Head2HeadApiClient {
  static const baseUrl = 'https://api.sportradar.us/soccer-xt3/intl';
  static const languageCode = 'ru';
  static const teamId = 'sr:competitor:4715';
  static const teamId2 = 'sr:competitor:4698';
  static const format = '.json';

  final http.Client httpClient;

  Head2HeadApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<Head2Head> getHead2Head() async {
    final url = "$baseUrl/$languageCode/teams/$teamId/versus/$teamId2/matches$format?api_key=$APIKEY";
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error getting info');
    }

    return null;
  }
}
