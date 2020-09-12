import 'package:flutter/material.dart';
import 'package:quizizz_cheat/screens/home.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                headline2: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
                bodyText1:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                bodyText2: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
        ),
        title: 'Quizizz cheat',
        home: Scaffold(
          body: HomePage(),
        )
      );
    
  }
}
