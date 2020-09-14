import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizizz_cheat/model/question_store.dart';
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
              'Enter your quizizz ID here',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(
              height: screenHeight(0.05),
            ),
            SizedBox(
              height: 10.0,
            ),
            UserTextField(),
          ],
        ),
      ),
    );
  }
}

class UserTextField extends StatelessWidget {
  const UserTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (url) => submitResult(context, url),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: "https://quizizz.com/quiz/quiz_ID",
      ),
    );
  }

  submitResult(BuildContext context, String url) {
    final store = Provider.of<QuestionStore>(context, listen: false);
    store.fetchQuestionData(url);
  }
}
