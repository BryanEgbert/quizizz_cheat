
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:quizizz_cheat/json/questions_data/questions_info.dart';
import 'package:quizizz_cheat/json/questions_data/questions_structure.dart';
import 'package:quizizz_cheat/services/screen_config.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({
    Key key,
    @required this.questionLength,
    @required this.structure,
  }) : super(key: key);

  final int questionLength;
  final Structure structure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
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
            width: screenWidth(0.2),
            height: screenHeight(0.3),
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
    );
  }
}

Column buildQuestionText(List<QuestionText> option, int answer, String kind,
    BuildContext context) {
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
          child: ((option[index].text) != "" || (option[index].text) != "")
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
                  option[index].media[0]["url"],
                  fit: BoxFit.contain,
                  width: 100.0,
                  height: 150.0
                ),
        );
      },
    ),
  );
}
