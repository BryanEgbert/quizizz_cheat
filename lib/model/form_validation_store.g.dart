// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_validation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormStore on _FormStore, Store {
  Computed<bool> _$canEnterComputed;

  @override
  bool get canEnter => (_$canEnterComputed ??=
          Computed<bool>(() => super.canEnter, name: '_FormStore.canEnter'))
      .value;

  final _$urlAtom = Atom(name: '_FormStore.url');

  @override
  String get url {
    _$urlAtom.reportRead();
    return super.url;
  }

  @override
  set url(String value) {
    _$urlAtom.reportWrite(value, super.url, () {
      super.url = value;
    });
  }

  final _$validateUrlAsyncAction = AsyncAction('_FormStore.validateUrl');

  @override
  Future<dynamic> validateUrl(String value) {
    return _$validateUrlAsyncAction.run(() => super.validateUrl(value));
  }

  @override
  String toString() {
    return '''
url: ${url},
canEnter: ${canEnter}
    ''';
  }
}

mixin _$FormValidationStore on _FormValidationStore, Store {
  Computed<bool> _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_FormValidationStore.hasError'))
          .value;

  final _$urlAtom = Atom(name: '_FormValidationStore.url');

  @override
  String get url {
    _$urlAtom.reportRead();
    return super.url;
  }

  @override
  set url(String value) {
    _$urlAtom.reportWrite(value, super.url, () {
      super.url = value;
    });
  }

  @override
  String toString() {
    return '''
url: ${url},
hasError: ${hasError}
    ''';
  }
}
