// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuestionStore on _QuestionStore, Store {
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

  final _$_QuestionStoreActionController =
      ActionController(name: '_QuestionStore');

  @override
  Future<dynamic> fetchQuestionData() {
    final _$actionInfo = _$_QuestionStoreActionController.startAction(
        name: '_QuestionStore.fetchQuestionData');
    try {
      return super.fetchQuestionData();
    } finally {
      _$_QuestionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
questionFuture: ${questionFuture}
    ''';
  }
}
