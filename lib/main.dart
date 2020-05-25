import 'package:bg_info/pages/games_collection_page/games_collection_controller.dart';
import 'package:bg_info/pages/home_page/home_page.dart';
import 'package:bg_info/pages/pages_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => PagesController()),
        Provider(create: (_) => GamesCollectionController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.purpleAccent,
          backgroundColor: Colors.purpleAccent.withOpacity(0.15),
        ),
        home: HomePage(),
      ),
    );
  }
}
