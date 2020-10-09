import 'package:flutter/material.dart';
import 'package:quizizz_cheat/json/questions_data/questions_info.dart';
import 'package:quizizz_cheat/screens/home_screen/body/body.dart';

class DesktopTabletLayout extends StatelessWidget {
  const DesktopTabletLayout({
    Key key,
    @required this.structure,
    @required this.questionLength,
  }) : super(key: key);

  final int questionLength;
  final Structure structure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(200.0, 8.0, 200.0, 0.0),
      child: Body(questionLength: questionLength, structure: structure),
    );
  }
}
