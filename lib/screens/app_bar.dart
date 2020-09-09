import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../json/questions_data/questions_quiz.dart';
import '../services/screen_config.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    String username = question.data.quiz.createdBy.local.username;
    Info info = question.data.quiz.info;
    Stats stats = question.data.quiz.stats;
    String publishedVersion = question.data.quiz.publishedVersion;

    ScreenConfig().init(context);
    return SliverAppBar(
      title: Text(
        "ID: ${question.data.quiz.id}",
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
      expandedHeight: screenHeight(0.5),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(info.image, width: screenWidth(1), height: screenHeight(0.15),),
              Text(
                "Created By: $username",
                style: Theme.of(context).textTheme.headline1,
              ),
              Row(
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
              ),
              Row(
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
              ),
              Row(
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
                        "> ${info.subtopics[index].toString()}",
                         style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Published Version: $publishedVersion",
                 style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total Players: ${stats.totalPlayers.toString()}",
                     style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    "Played: ${stats.played.toString()} times",
                     style: Theme.of(context).textTheme.headline2,
                  )
                ],
              )
            ],
          ),
        ),
      ),
      floating: false,
      pinned: true,
      snap: false,
    );
  }
}
