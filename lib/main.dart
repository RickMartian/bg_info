import 'package:bg_info/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mobx/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Pages>(
      create: (_) => Pages(),
      lazy: false,
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
