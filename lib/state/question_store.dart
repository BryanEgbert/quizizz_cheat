import 'package:mobx/mobx.dart';
import 'package:quizizz_cheat/json/questions.dart';
import 'package:quizizz_cheat/services/questions_service.dart';

part 'question_store.g.dart';

class QuestionStore = _QuestionStore with _$QuestionStore;

abstract class _QuestionStore with Store {
  final QuestionsService questionsService = QuestionsService();

  @observable
  ObservableFuture<CoreData> questionFuture;

  @action
  Future fetchQuestionData() => questionFuture = ObservableFuture(
    questionsService.fetchQuestion('https://quizizz.com/quiz/5a133e2302b92110003fd8ef').then((value) => value)
  );

  void getQuestion() {
    fetchQuestionData();
  }
}
