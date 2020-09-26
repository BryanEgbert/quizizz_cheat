import 'package:flutter/material.dart';
import '../../json/questions.dart';
import '../../json/questions_data/questions_quiz.dart';
import '../user_input.dart';
import '../../services/screen_config.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key key,
    @required this.question,
  }) : super(key: key);

  final CoreData question;
  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return SliverAppBar(
      title: Text(
        // Show the Quizizz ID
        "ID: ${question.data.quiz.id}",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 17.0),
      ),
      centerTitle: true,
      // Search Bar
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
          child: UserTextField(),
        ),
      ),
    );
  }

  /// For every subjects inside the list of subjects.
  /// Display it in the [SliverAppBar] as String.
  Row buildSubjectRow(BuildContext context, Info info) {
    return Row(
      children: [
        Text(
          "Subject: ",
          style: Theme.of(context).textTheme.headline1,
        ),
        Row(
          children: List.generate(
            info.subjects.length,
            (index) => Text(
              "${info.subjects[index].toString()}",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
      ],
    );
  }

  Row buildTopicRow(BuildContext context, Info info) {
    return Row(
      children: [
        Text(
          "Topics: ",
        ),
        Row(
          children: List.generate(
            info.topics.length,
            (index) => Text(
              "Topics: ${info.topics[index].toString()}",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
      ],
    );
  }

  Row buildSubtopicRow(BuildContext context, Info info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Subtopics: ",
          style: Theme.of(context).textTheme.headline1,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            info.subtopics.length,
            (index) => Text(
              "- ${info.subtopics[index].toString()}",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
      ],
    );
  }

  Row buildPlayerRow(Stats stats, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Total Players: ${stats.totalPlayers.toString()}",
          style: Theme.of(context).textTheme.headline2,
        ),
        Text(
          "Played: ${stats.played.toString()} times",
          style: Theme.of(context).textTheme.headline2,
        ),
      ],
    );
  }
}
