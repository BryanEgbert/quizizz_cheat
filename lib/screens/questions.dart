import 'package:flutter/material.dart';
import 'package:quizizz_cheat/json/questions.dart';
import 'package:quizizz_cheat/json/questions_data/questions_structure.dart';
import 'package:quizizz_cheat/services/screen_config.dart';

class CustomSliverList extends StatelessWidget {
  const CustomSliverList({
    Key key,
    @required this.question,
  }) : super(key: key);

  final CoreData question;

  @override
  Widget build(BuildContext context) {
    int questionLength = question.data.quiz.info.questions.length;
    ScreenConfig().init(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, questionLength) {
          Query questionQuery =
              question.data.quiz.info.questions[questionLength].structure.query;
          List<QuestionText> option = question
              .data.quiz.info.questions[questionLength].structure.options;
          int answer = question
              .data.quiz.info.questions[questionLength].structure.answer;

          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.network(
                      questionQuery.media.isEmpty
                          ? "https://moorestown-mall.com/noimage.gif"
                          : questionQuery.media[0].url,
                      fit: BoxFit.cover,
                    ), // Image of the questions
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${questionLength + 1}. ${question.data.quiz.info.questions[questionLength].structure.query.text}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ), // Question's index
                    buildQuestionText(option, answer, context), // The questions
                  ],
                ),
              ),
            ),
          );
        },
        childCount: questionLength, //  Total number of questions
      ),
    );
  }

  Column buildQuestionText(
      List<QuestionText> option, int answer, BuildContext context) {
    return Column(
      children: List.generate(
        option.length,
        (index) {
          return Container(
            width: screenWidth(1),
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              color: (answer != index)
                  ? Colors.redAccent
                  : Colors.greenAccent[700],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              option[index].text,
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
