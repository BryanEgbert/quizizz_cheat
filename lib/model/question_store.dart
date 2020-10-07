
import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:quizizz_cheat/json/questions.dart';
import 'package:quizizz_cheat/services/questions_service.dart';

part 'question_store.g.dart';

class QuestionStore = _QuestionStore with _$QuestionStore;

enum StoreState {initial, loading, loaded}

abstract class _QuestionStore with Store {
  final QuestionsService questionsService;

  _QuestionStore(this.questionsService);
  @observable
  ObservableFuture<CoreData> questionFuture;

  @observable
  CoreData questionsData;

  @observable
  String errorMessage;


  @computed
  StoreState get state {
    if (questionFuture == null ||
        questionFuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return questionFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }
  
  @action
  Future fetchQuestionData(String value) async{
    try{
      // Reset the error message
      errorMessage = null;
      questionFuture = ObservableFuture(
        questionsService.fetchQuestion(value).then((value) => value));
      questionsData = await questionFuture;
    // If there is an error, give errorMessage a String value
    // of the error
    } on HttpException {
      errorMessage = "Error 404: Data Not Found";
    } on SocketException{
      errorMessage = "No connection";
    } on FormatException {
      errorMessage = "ID not valid";
    }
  }
}
