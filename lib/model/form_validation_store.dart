import 'package:mobx/mobx.dart';

part 'form_validation_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  final FormValidationStore error = FormValidationStore();

  @observable
  String url = '';

  @computed
  bool get canEnter => error.hasError;

  ReactionDisposer _disposer;

  void validate() {
    _disposer = reaction((_) => url, validateUrl);
  }

  @action
  Future validateUrl(String value) async {
    if (value.isEmpty) {
      error.url = 'Cannot be blank';
      return;
    } else if (value.length < 26 && !value.contains("/")) {
      error.url = 'Not a valid url';
      return;
    } 
  }

  void dispose() {
    _disposer();
  }

  void startValidate() {
    validateUrl(url);
  }
}

class FormValidationStore = _FormValidationStore with _$FormValidationStore;

abstract class _FormValidationStore with Store {
  @observable
  String url;

  @computed
  bool get hasError => url != null || url.length > 25 || url.contains("/");
}

