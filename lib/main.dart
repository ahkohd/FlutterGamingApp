import 'package:flutter/material.dart';
import 'package:gamesapp/screens/GameDetails.dart';
import 'package:gamesapp/screens/GameHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Games App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GamesHome(),
      routes: <String, WidgetBuilder>{
        '/gameHome': (BuildContext context) => GamesHome(),
        '/gameDetails': (BuildContext context) => GameDetails(
              poster: "images/apex-poster.jpg",
              gameTitle: "Apex Legends",
            )
      },
    );
  }
}
