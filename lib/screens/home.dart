import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:quizizz_cheat/screens/app_bar.dart';
import 'package:quizizz_cheat/screens/questions.dart';
import 'package:quizizz_cheat/services/screen_config.dart';
import 'package:quizizz_cheat/state/question_store.dart';

class HomePage extends StatelessWidget {
  final QuestionStore store = QuestionStore();

  HomePage() {
    store.getQuestion();
  }

  Widget build(BuildContext context) {
    ScreenConfig().init(context);

    final future = store.questionFuture;
    return Observer(
      builder: (_) {
        switch (future.status) {
          case FutureStatus.pending:
            return Center(child: CircularProgressIndicator());

          case FutureStatus.rejected:
            return Center(child: Text("url not found"));

          case FutureStatus.fulfilled:
            final question = future.result;

            return CustomScrollView(
              slivers: [
                CustomSliverAppBar(question: question),
                CustomSliverList(
                    question: question),
              ],
            );
            break;
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}