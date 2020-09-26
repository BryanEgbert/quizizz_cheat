import 'package:flutter/material.dart';
import 'package:quizizz_cheat/json/questions_data/questions_info.dart';

import 'body_content.dart';

class DesktopTabletLayout extends StatelessWidget {
  const DesktopTabletLayout({
    Key key,
    @required this.structure,
    @required this.questionLength,
    @required this.scrollController,
  }) : super(key: key);

  final int questionLength;
  final Structure structure;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(200.0, 8.0, 200.0, 0.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: BodyContent(
          questionLength: questionLength,
          structure: structure,
        ),
      ),
    );
  }
}
