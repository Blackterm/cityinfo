import 'package:cityinfo/app/pages/home/home_view.dart';
import 'package:cityinfo/app/pages/register/register_presenter.dart';
import 'package:cityinfo/domain/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class RegisterController extends Controller {
  final RegisterPresenter _presenter;

  RegisterController(UserRepository _userRepository)
      : _presenter = RegisterPresenter(_userRepository);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? firstName;
  String? lastName;
  String? email;
  String? password;

  bool areFieldsIsEmpty = false;

  @override
  void onInitState() {
    super.onInitState();
  }

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }

  void initListeners() {
    _presenter.createUserOnComplete = () {
      _presenter.signInWithEmail(email!, password!);
    };

    _presenter.signWithEmailOnComplete = () {
      Navigator.push(
        getContext(),
        CupertinoPageRoute(
          builder: (context) => HomeView(),
        ),
      );
    };

    _presenter.createUserOnError = (e) {
      if (e == "already used")
        showDialog(
            context: getContext(),
            builder: (getContext) => AlertDialog(
                  title: Text("Something went wrong.Try again"),
                  content: Text(
                      "The email address is already in use by another account."),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(getContext);
                        },
                        child: Text("Close")),
                  ],
                ));
      ;
    };
    _presenter.signInWithEmailOnError = (e) {
      showDialog(
          context: getContext(),
          builder: (getContext) => AlertDialog(
                title: Text("Something went wrong.Try again"),
                content: Text(e.message),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(getContext);
                      },
                      child: Text("Close")),
                ],
              ));
    };
  }

  void checkFields() {
    if ((email != null &&
            password != null &&
            firstName != null &&
            lastName != null) &&
        (email != "" && password != "" && firstName != "" && lastName != "")) {
      areFieldsIsEmpty = true;
    } else {
      areFieldsIsEmpty = false;
    }
  }

  void onEmailTextChanged(String value) {
    email = value.trim();
    checkFields();
    refreshUI();
  }

  void onPasswordTextChanged(String value) {
    password = value;
    checkFields();
    refreshUI();
  }

  void onFirstNameTextChanged(String value) {
    firstName = value;
    checkFields();
    refreshUI();
  }

  void onLastNameChanged(String value) {
    lastName = value;
    checkFields();
    refreshUI();
  }

  void createUser() {
    _presenter.createUser(firstName!, lastName!, email!, password!);
    refreshUI();
  }

  void refreshScreen() {
    refreshUI();
  }
}
