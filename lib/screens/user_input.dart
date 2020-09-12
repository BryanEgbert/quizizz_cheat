import 'package:flutter/material.dart';
import '../services/screen_config.dart';

class UserInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        color: Colors.blueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter yout quizizz ID here',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(
              height: screenHeight(0.05),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
