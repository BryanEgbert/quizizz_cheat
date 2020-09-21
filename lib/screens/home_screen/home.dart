import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:connectivity/connectivity.dart';
import '../../model/connection_store.dart';
import '../../model/question_store.dart';
import './app_bar.dart';
import './questions.dart';
import '../user_input.dart';
import '../../services/screen_config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuestionStore _store;
  ConnectivityStore _connectivityStore;
  List<ReactionDisposer> _reactionDisposer;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store ??= Provider.of<QuestionStore>(context, listen: false);
    _connectivityStore = Provider.of<ConnectivityStore>(context, listen: false);
    _reactionDisposer ??= <ReactionDisposer>[

      /// Checking the [errorMessage]. If [errorMessage] is not null,
      /// show [SnackBar] displaying the [errorMessage]
      reaction(
        (_) => _store.errorMessage,
        (String message) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
        },
      ),
      /// Show [SnackBar] everytime if [ConnectivityStore.connectivityStream.value] changes
      /// with delay of 4000 milliseconds
      reaction(
        (_) => _connectivityStore.connectivityStream.value,
        (result) => _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(
              result == ConnectivityResult.none
                  ? "No Internet Connection"
                  : "You\"re Online",
            ),
          ),
        ),
        delay: 4000
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
      key: _scaffoldKey,
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
              return UserInput();

            case StoreState.loaded:
              return CustomScrollView(
                slivers: [
                  CustomSliverAppBar(question: _store.questionsData),
                  CustomSliverList(question: _store.questionsData),
                ],
              );

              break;
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
