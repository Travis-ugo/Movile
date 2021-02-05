import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'api_manager.dart';
import 'home/movie_app.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soccer App',
      // theme: ThemeData(
      //   primarySwatch: Colors.black,
      // ),
      home: HomePage(),
    );
  }
}
