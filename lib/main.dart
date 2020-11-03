import 'package:flutter/material.dart';
import './model/form_validation_store.dart';
import './model/question_store.dart';
import 'package:provider/provider.dart';
import './services/questions_service.dart';
import 'screens/home_screen/home.dart';
import 'screens/user_input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<QuestionStore>(
          create: (context) => QuestionStore(QuestionsService()),
        ),
        Provider<FormStore>(
          create: (context) => FormStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                headline2: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
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
        initialRoute: "/home",
        routes: {
          "/home": (context) => InitialHomeScreen(),
          "/answer": (context) => HomePage(),
        },
        home: InitialHomeScreen(),
      ),
    );
  }
}
