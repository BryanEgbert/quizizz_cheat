import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizizz_cheat/model/question_store.dart';
import '../services/screen_config.dart';

class UserInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    TextEditingController _controller = TextEditingController();

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
            TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: 'Quizizz ID',
              ),
            ),
            RaisedButton(onPressed: () {
              submitResult(context, _controller.text);
            })
          ],
        ),
      ),
    );
  }

  submitResult(BuildContext context, String url) {
    final store = Provider.of<QuestionStore>(context, listen: false);
    store.fetchQuestionData(url);
  }
}
