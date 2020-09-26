import 'package:flutter/material.dart';
import 'package:quizizz_cheat/screens/home_screen/body/desktop_tablet_layout.dart';
import 'package:quizizz_cheat/services/responsive_widget.dart';
import '../../json/questions.dart';
import '../../json/questions_data/questions_info.dart';
import '../../services/screen_config.dart';
import 'body/mobile_body.dart';

class CustomSliverList extends StatelessWidget {
  const CustomSliverList({
    Key key,
    @required this.question,
    @required this.scrollController,
  }) : super(key: key);

  final CoreData question;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    int questionLength = question.data.quiz.info.questions.length;

    ScreenConfig().init(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, questionLength) {
          Structure structure =
              question.data.quiz.info.questions[questionLength].structure;

          // This code display the content of the JSON file in the link
          return ResponsiveWidget(
            mobileLayout: MobileBodyLayout(
              structure: structure,
              questionLength: questionLength,
              scrollController: scrollController,
            ),
            desktopTabletLayout: DesktopTabletLayout(
              structure: structure,
              questionLength: questionLength,
              scrollController: scrollController,
            ),
          );
        },
        childCount: questionLength, //  Total number of questions
      ),
    );
  }
}
