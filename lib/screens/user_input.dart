import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:quizizz_cheat/model/form_validation_store.dart';
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

class UserTextField extends StatefulWidget {
  const UserTextField({
    Key key,
  }) : super(key: key);

  @override
  _UserTextFieldState createState() => _UserTextFieldState();
}

class _UserTextFieldState extends State<UserTextField> {
  final FormStore _formStore = FormStore();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _formStore.validate();
  }

  @override
  void dispose() {
    _formStore.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => TextField(
        controller: _controller,
        onSubmitted: (value) => _formStore.error.url,
        onChanged: (value) => _formStore.url = value,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                submitResult(context, _controller.text);
              }),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: "https://quizizz.com/quiz/quiz_ID",
          errorText: _formStore.error.url,
        ),
      ),
    );
  }

  submitResult(BuildContext context, String url) {
    final store = Provider.of<QuestionStore>(context, listen: false);
    store.fetchQuestionData(url);
  }
}
