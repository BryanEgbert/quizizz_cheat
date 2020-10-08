import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../model/form_validation_store.dart';
import '../model/question_store.dart';
import '../services/screen_config.dart';

class InitialHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        color: Colors.blueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your quizizz ID here',
              style: Theme.of(context).textTheme.bodyText2,
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
  FormStore _formStore;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _formStore = Provider.of<FormStore>(context, listen: false);
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
      builder: (_) => ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 700,
              ),
              child: TextField(
          controller: _controller,
          onChanged: (value) => _formStore.url = value,
          onSubmitted: (value) {
            _formStore.startValidate();
            submitResult(context, _controller.text);
          },
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10.0),
            fillColor: Colors.white,
            filled: true,
            suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  _formStore.startValidate();
                  submitResult(context, _controller.text);
                }),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: "quiz_ID",
            errorText: _formStore.error.url,
            errorStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  submitResult(BuildContext context, String url) {
    final store = Provider.of<QuestionStore>(context, listen: false);
    store.fetchQuestionData(url);
  }
}
