import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizizz_cheat/services/input_service.dart';

class LoginForm extends StatefulWidget {
  final Function onFormSaved;

  const LoginForm({Key key, @required this.onFormSaved}) : super(key: key);

  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _autoValidate;

  GlobalKey<FormState> _formKey;

  TextEditingController _inputTextEditingController;

  @override
  void initState() {
    super.initState();

    _autoValidate = false;

    _formKey = GlobalKey<FormState>();

    _inputTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Column(
        children: [
          TextFormField(
            controller: _inputTextEditingController,
            decoration: InputDecoration(labelText: "Quizizz ID"),
            validator: (String value) => _validateFormField(value, "url"),
          ),
          FlatButton(
            onPressed: _onLoginPressed,
            child: Text("Enter"),
          )
        ],
      ),
    );
  }

  _onLoginPressed() {
    setState(() {
      _autoValidate = true;
    });

    if (_formKey.currentState.validate()) {
      widget.onFormSaved(
          userInput: _inputTextEditingController.text,
      );
    }
  }

  String _validateFormField(String value, String fieldName) {
    if (value.isEmpty) {
      return "$fieldName cannot be empty.";
    }

    return null;
  }

  @override
  void dispose() {
    _inputTextEditingController.dispose();

    super.dispose();
  }
}
