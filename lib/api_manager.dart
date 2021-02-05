import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SoccerApi {
  final String apiUrl = 'https://v3.football.api-sports.io/fixtures?live=all';
  static const api_key = '58b8924bf7369cf14fee68aebec592';
}

class Calls extends StatefulWidget {
  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  //List _table;

  getTable() async {
    http.Response response = await http.get(
      'http://api.football-data.org/v2/competitions/epl/standings',
      headers: {'X-Auth-Token ': '5fee4ef65f6a4a8c8df6f64904c9a7cc'},
    );
    String body = response.body;
    Map data = jsonDecode(body);
    List table = data['standings'][0]['table'];
    print(table);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 0.0,
        onPressed: () {
          getTable();
        },
      ),
      body: Center(
        child: Text('Loco and smoke'),
      ),
    );
  }
}
