import 'package:cityinfo/app/pages/home/home_view.dart';
import 'package:cityinfo/app/pages/login/login_presenter.dart';
import 'package:cityinfo/domain/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lottie/lottie.dart';

class LoginController extends Controller {
  final LoginPresenter _presenter;

  LoginController(UserRepository _userRepository)
      : _presenter = LoginPresenter(_userRepository);

  String? email;
  String? password;
  // Test için direkt sayfaya geçiş
  // @override
  // void onInitState() {
  //   FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //     if (user != null) {
  //       Navigator.pushAndRemoveUntil(
  //           getContext(),
  //           CupertinoPageRoute(builder: (context) => HomeView()),
  //           (route) => false);
  //     }
  //   });
  //   super.onInitState();
  // }

  @override
  void initListeners() {
    _presenter.singWithEmailOnComplate = () {
      Navigator.push(
        getContext(),
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    };
    _presenter.singWithEmailOnError = (e) {
      showDialog(
          context: getContext(),
          builder: (getContext) => AlertDialog(
                content: Container(
                  height: 250,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        child: Lottie.asset(
                          'assets/animations/somethingWentWrong.json',
                        ),
                      ),
                      Container(
                        child: Expanded(
                          child: SingleChildScrollView(
                            child: Text(e.message),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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

  void onEmailTextChanged(String value) {
    email = value;
    refreshUI();
  }

  void onPasswordTextChanged(String value) {
    password = value;
    refreshUI();
  }

  void signIn() {
    _presenter.signInWithEmail(email!, password!);
    refreshUI();
  }
}
