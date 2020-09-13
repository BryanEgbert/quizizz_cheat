// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuestionStore on _QuestionStore, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state => (_$stateComputed ??=
          Computed<StoreState>(() => super.state, name: '_QuestionStore.state'))
      .value;

  final _$questionFutureAtom = Atom(name: '_QuestionStore.questionFuture');

  @override
  ObservableFuture<CoreData> get questionFuture {
    _$questionFutureAtom.reportRead();
    return super.questionFuture;
  }

  @override
  set questionFuture(ObservableFuture<CoreData> value) {
    _$questionFutureAtom.reportWrite(value, super.questionFuture, () {
      super.questionFuture = value;
    });
  }

  final _$questionsDataAtom = Atom(name: '_QuestionStore.questionsData');

  @override
  CoreData get questionsData {
    _$questionsDataAtom.reportRead();
    return super.questionsData;
  }

  @override
  set questionsData(CoreData value) {
    _$questionsDataAtom.reportWrite(value, super.questionsData, () {
      super.questionsData = value;
    });
  }

  final _$fetchQuestionDataAsyncAction =
      AsyncAction('_QuestionStore.fetchQuestionData');

  @override
  Future<dynamic> fetchQuestionData(String value) {
    return _$fetchQuestionDataAsyncAction
        .run(() => super.fetchQuestionData(value));
  }

  @override
  String toString() {
    return '''
questionFuture: ${questionFuture},
questionsData: ${questionsData},
state: ${state}
    ''';
  }
}
