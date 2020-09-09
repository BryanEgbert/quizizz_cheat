import 'package:flutter/material.dart';
import '../screens/app_bar.dart';
import '../screens/questions.dart';

class HomePage extends StatelessWidget {
  static Route<Object> route() =>  MaterialPageRoute(
        builder: (BuildContext context) => HomePage(),
      );
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: question == null
            ? Center(child: CircularProgressIndicator())
            : buildCustomScrollView()
      );
  }

  CustomScrollView buildCustomScrollView() {
    return CustomScrollView(
      slivers: [
        CustomAppBar(),
        CustomList(),
      ],
    );
  }

}
