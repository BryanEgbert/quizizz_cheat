import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:quizizz_cheat/json/questions_data/questions_quiz.dart';
import '../../json/questions.dart';
import '../../json/questions_data/questions_info.dart';
import '../../json/questions_data/questions_structure.dart';
import '../../services/screen_config.dart';

class CustomSliverList extends StatelessWidget {
  const CustomSliverList({
    Key key,
    @required this.question,
  }) : super(key: key);

  final CoreData question;

  @override
  Widget build(BuildContext context) {
    int questionLength = question.data.quiz.info.questions.length;
    String username = question.data.quiz.createdBy.local.username;
    Info info = question.data.quiz.info;
    Stats stats = question.data.quiz.stats;
    String publishedVersion = question.data.quiz.publishedVersion;

    ScreenConfig().init(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, questionLength) {
          Structure structure =
              question.data.quiz.info.questions[questionLength].structure;

          // This code display the content of the JSON file in the link
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
                    (info.image != null)
                        ? Container(
                            color: Colors.grey[50],
                            child: Image.network(
                              info.image,
                              width: screenWidth(0.3),
                              height: screenHeight(0.5),
                              fit: BoxFit.contain,
                            ) // Thumbnail
                            )
                        : Container(color: Colors.grey[50]),
                    // Info about the creator, subjects, topics, subtipics, and players
                    Container(
                      color: Colors.grey[50],
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Created By: $username",
                            style: Theme.of(context).textTheme.headline1,
                          ), //Created By
                          buildSubjectRow(context, info), // Subject
                          buildTopicRow(context, info), // Topic
                          buildSubtopicRow(context, info), // Subtopic
                          Text(
                            // Showing the published version
                            "Published Version: $publishedVersion",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(height: 10.0),
                          buildPlayerRow(
                              stats, context) // Amount of Players and Played
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    // Question's index + 1
                    Text(
                      "${questionLength + 1}.",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 5.0),

                    // If there is no image used for the question, display 'No Image' image
                    // Else display the image used
                    Image.network(
                      (structure.query.media.isEmpty)
                          ? "https://moorestown-mall.com/noimage.gif"
                          : structure.query.media[0].url,
                      width: screenWidth(0.3),
                      fit: BoxFit.contain,
                    ), // Image of the questions
                    SizedBox(
                      height: 10.0,
                    ),

                    /// The question's content.
                    ///
                    /// If the questions [hasMath] = false. Just parse HTML to Dart as normal.
                    /// Else if questions [hasMath] = true. Parse HTML to Dart and display {$index}(The math equation).
                    /// At the bottom of the questions. This is not a good code because i can't find a solution for this..
                    (structure.query.hasMath == false)
                        ? Html(
                            data: "<p>${structure.query.text}</p>",
                            style: {
                              "p": Style(
                                fontSize: FontSize(18.0),
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                              "div": Style(
                                fontSize: FontSize(18.0),
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            },
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Html(
                                      data: "${structure.query.math.template}",
                                      style: {
                                        "p": Style(
                                          fontSize: FontSize(18.0),
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                        "div": Style(
                                          fontSize: FontSize(18.0),
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                // Displaying the {$index}
                                "{i} = ${structure.query.math.latex.map((e) => e).toString()}",
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                    buildQuestionText(structure.options, structure.answer,
                        structure.kind, context), // The options
                    SizedBox(height: 10.0),

                    // Display the type of question and answer for questions whose
                    // type is not "MCQ"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Type: ${structure.kind}",
                          style: TextStyle(fontSize: 13.0, color: Colors.blue),
                        ),
                        (structure.kind == "MSQ")
                            ? Text(
                                "Answers: ${(structure.answer).map((e) => e).toString()}",
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.red,
                                ),
                              )
                            : Text("."),
                      ],
                    ), // Question's type and answer index
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

  Column buildQuestionText(List<QuestionText> option, dynamic answer,
      String kind, BuildContext context) {
    return Column(
      children: List.generate(
        option.length, // Length of the options in current question's index
        (index) {
          // Display the content of the options
          return Container(
            width: screenWidth(1),
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              color: (kind == "MCQ")
                  ? (answer != index)
                      ? Colors.redAccent
                      : Colors.greenAccent[700]
                  : Colors.blueAccent,
              borderRadius: BorderRadius.circular(10.0),
            ),

            // If the options is image-based, display the image
            // Else if the question is text-based, display the text
            child: ((option[index].text) != null)
                // If the text contain HTML paragrafh text
                ? (option[index].text.contains("<p>"))
                    ? Html(
                        data: option[index].text,
                        style: {
                          "p": Style(
                            fontSize: FontSize(18.0),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            textAlign: TextAlign.center,
                          )
                        },
                      )
                    // Else if the text doesn't contain the tag
                    : Text(
                        option[index].text,
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center,
                      )
                : Image.network(
                    option[index].media[0]['url'],
                    fit: BoxFit.contain,
                  ),
          );
        },
      ),
    );
  }
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
