import 'package:covidtracker/datasource.dart';
import 'package:covidtracker/homepage.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'OpenSansCondensed',
          primaryColor: primaryBlack,
          brightness: Brightness.light),
      home: HomePage(),
    );
  }
}
