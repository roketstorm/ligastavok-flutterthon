import 'package:flutter/material.dart';
import 'package:lsflutterthon/models/head2head.dart';
import 'package:lsflutterthon/repositories/head2head_api_client.dart';

class Head2HeadRepository {
  final Head2HeadApiClient client;

  Head2HeadRepository({@required this.client}) : assert(client != null);

  Future<Head2Head> getInfo(String team1, String team2) async {
    final Head2Head data =
        await client.getHead2Head(teamId: team1, teamId2: team2);
    data.team1.imageUrl = await client.getTeamLogo(data.team1.country);
    data.team2.imageUrl = await client.getTeamLogo(data.team2.country);
    return data;
  }
}
