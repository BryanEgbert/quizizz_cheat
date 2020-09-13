import 'package:mobx/mobx.dart';
import 'package:quizizz_cheat/json/questions.dart';
import 'package:quizizz_cheat/services/questions_service.dart';

part 'question_store.g.dart';

class QuestionStore = _QuestionStore with _$QuestionStore;

enum StoreState {initial, loading, loaded}

abstract class _QuestionStore with Store {
  final QuestionsService questionsService = QuestionsService();

  @observable
  ObservableFuture<CoreData> questionFuture;

  @observable
  CoreData questionsData;

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
    questionFuture = ObservableFuture(
        questionsService.fetchQuestion(value));
    questionsData = await questionFuture;
  }
}
