import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ward_app/src/screens/home.dart';

void main() => runApp(
  ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Color(0xFF064479)),
          primaryColor: Color(0xFF064479),
          backgroundColor: Color(0xFFb7eeff),
      ),
      home: Home(),
    );
  }
}
