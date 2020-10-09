import 'package:flutter/material.dart';
import 'package:quizizz_cheat/json/questions_data/questions_info.dart';

import 'body_content.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required this.questionLength,
    @required this.structure,
  }) : super(key: key);

  final int questionLength;
  final Structure structure;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: BodyContent(
        questionLength: questionLength,
        structure: structure,
      ),
    );
  }
}
