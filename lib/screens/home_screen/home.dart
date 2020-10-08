import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import '../../model/question_store.dart';
import './app_bar.dart';
import './questions.dart';
import '../user_input.dart';
import '../../services/screen_config.dart';

class HomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuestionStore _store;
  ScrollController _scrollController;
  List<ReactionDisposer> _reactionDisposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store ??= Provider.of<QuestionStore>(context, listen: false);
    _scrollController = ScrollController();
    // The reaction
    _reactionDisposer ??= <ReactionDisposer>[
      /// Checking the [errorMessage].
      ///
      /// If [errorMessage] is not null,
      /// show [SnackBar] displaying the [errorMessage]
      reaction(
        (_) => _store.errorMessage,
        (String message) {
          widget._scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
        },
      ),
    ];
  }

  @override
  void dispose() {
    // Disposing the reactions
    _reactionDisposer.forEach((reaction) => reaction());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);

    return Scaffold(
      key: widget._scaffoldKey,

      /// Checking [StoreState]
      ///
      /// If [StoreState.loading] return [CircularProgressIndicator] wrap with a [Center].
      /// Else if [StoreState.initial] return [UserInput()].
      /// If [StoreState.loaded] return [CostumScrollView] that contain [CustomSliverAppBar()]
      /// and [CustomSliverList()]. Else return [CircularProgressIndicator].
      body: Observer(
        builder: (_) {
          switch (_store.state) {
            case StoreState.loading:
              return Center(child: CircularProgressIndicator());

            case StoreState.initial:
              return InitialHomeScreen();

            case StoreState.loaded:
              return CupertinoScrollbar(
                isAlwaysShown: true,
                controller: _scrollController,
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    CustomSliverHeader(question: _store.questionsData),
                    CustomSliverList(
                      question: _store.questionsData,
                    ),
                  ],
                ),
              );

              break;
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
