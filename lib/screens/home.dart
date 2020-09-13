import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:quizizz_cheat/screens/app_bar.dart';
import 'package:quizizz_cheat/screens/questions.dart';
import 'package:quizizz_cheat/screens/user_input.dart';
import 'package:quizizz_cheat/services/screen_config.dart';
import 'package:quizizz_cheat/model/question_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuestionStore _store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store ??= Provider.of<QuestionStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);

    return Scaffold(
      body: Observer(
        builder: (_) {
          switch (_store.state) {
            case StoreState.loading:
              return Center(child: CircularProgressIndicator());

            case StoreState.initial:
              return UserInput();

            case StoreState.loaded:
              return CustomScrollView(
                slivers: [
                  CustomSliverAppBar(question: _store.questionsData),
                  CustomSliverList(question: _store.questionsData),
                ],
              );

              break;
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
