import 'package:flutter/material.dart';
import 'package:quizizz_cheat/json/questions_data/questions_structure.dart';
import 'package:quizizz_cheat/services/screen_config.dart';

class CustomSliverList extends StatelessWidget {
  const CustomSliverList({
    Key key,
    @required this.question,
  }) : super(key: key);

  final question;

  @override
  Widget build(BuildContext context) {
    int questionLength = question.data.quiz.info.questions.length;
    ScreenConfig().init(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, questionLength) {
          Query questionQuery =
              question.data.quiz.info.questions[questionLength].structure.query;
          List<dynamic> option = question
              .data.quiz.info.questions[questionLength].structure.options;

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
                    ),
                    Text(
                      "${questionLength + 1}. ${question.data.quiz.info.questions[questionLength].structure.query.text}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Column(
                      children: List.generate(
                        option.length,
                        (index) => Container(
                          width: screenWidth(1),
                          margin: EdgeInsets.only(top: 8.0),
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          decoration: BoxDecoration(
                            color: (question
                                        .data
                                        .quiz
                                        .info
                                        .questions[questionLength]
                                        .structure
                                        .answer !=
                                    index)
                                ? Colors.redAccent
                                : Colors.greenAccent[700],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            option[index]['text'],
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: questionLength,
      ),
    );
  }
}
