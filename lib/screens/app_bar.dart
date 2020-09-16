import 'package:flutter/material.dart';
import 'package:quizizz_cheat/json/questions.dart';
import 'package:quizizz_cheat/json/questions_data/questions_quiz.dart';
import 'package:quizizz_cheat/screens/user_input.dart';
import 'package:quizizz_cheat/services/screen_config.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key key,
    @required this.question,
  }) : super(key: key);

  final CoreData question;
  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    String username = question.data.quiz.createdBy.local.username;
    Info info = question.data.quiz.info;
    Stats stats = question.data.quiz.stats;
    String publishedVersion = question.data.quiz.publishedVersion;

    return SliverAppBar(
      title: Text(
        "ID: ${question.data.quiz.id}",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 17.0),
      ), //Quizizz ID
      centerTitle: true,
      expandedHeight: screenHeight(0.5),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Stack(
          children: [
            // If the creator use a thumbnail, display in the app bar as a background
            // Else if there is no thumbnail, return blue container.
            (info.image != null)
                ? Container(
                    child: Image.network(
                    info.image,
                    width: screenWidth(1),
                    height: screenHeight(1),
                    fit: BoxFit.cover,
                  ) // Thumbnail
                    )
                : Container(color: Colors.blue),

            // Black overlay
            Container(color: Color.fromRGBO(0, 0, 0, 0.7)),

            // Info about the creator, subjects, topics, subtipics, and players
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 90.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Created By: $username",
                    style: Theme.of(context).textTheme.headline1,
                  ), //Created By
                  buildSubjectRow(context, info), // Subject
                  buildTopicRow(info, context), // Topic
                  buildSubtopicRow(context, info), // Subtopic
                  Text(
                    "Published Version: $publishedVersion",
                    style: Theme.of(context).textTheme.headline1,
                  ), // Published Version
                  SizedBox(height: 10.0),
                  buildPlayerRow(stats, context) // Amount of Players and Played
                ],
              ),
            ),
          ],
        ),
      ),

      // Search Bar
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
          child: UserTextField(),
        ),
      ),
      pinned: true,
    );
  }

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

  Row buildTopicRow(Info info, BuildContext context) {
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
