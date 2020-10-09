import 'package:flutter/material.dart';
import 'package:quizizz_cheat/json/questions_data/questions_info.dart';

import '../body.dart';

class MobileBodyLayout extends StatelessWidget {
  const MobileBodyLayout({
    Key key,
    @required this.structure,
    @required this.questionLength,
  }) : super(key: key);

  final int questionLength;
  final Structure structure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 5.0),
      child: Body(questionLength: questionLength, structure: structure),
    );
  }
}
