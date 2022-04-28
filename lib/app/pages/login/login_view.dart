import 'package:cityinfo/app/pages/login/login_controller.dart';
import 'package:cityinfo/app/pages/register/register_view.dart';
import 'package:cityinfo/data/repositories/data_user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginView extends View {
  @override
  State<StatefulWidget> createState() {
    return _LoginViewState(
      LoginController(
        DataUserRepository(),
      ),
    );
  }
}

class _LoginViewState extends ViewState<LoginView, LoginController> {
  _LoginViewState(LoginController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: globalKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ControlledWidgetBuilder<LoginController>(
                builder: (context, controller) {
              return Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 52,
                      left: 24,
                      right: 18,
                    ),
                    child: Image.asset("assets/image/Login-image.png"),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: size.width - 36,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(235, 221, 218, 218),
                          offset: Offset(5, 2),
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) =>
                          {controller.onEmailTextChanged(value)},
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "  " + 'Email',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: size.width - 36,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(235, 221, 218, 218),
                          offset: Offset(5, 2),
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) =>
                          {controller.onPasswordTextChanged(value)},
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "  " + 'Password',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () async {
                          controller.signIn();
                        },
                        child: Container(
                          width: 127,
                          height: 53,
                          decoration: BoxDecoration(
                            color: Color(0xFF6c63ff),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Center(
                            child: Text(
                              "Giriş Yap",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                    ),
                    child: Row(
                      children: [
                        Text("Hesabınız yok mu ?"),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => RegisterView(),
                                ),
                              );
                            },
                            child: Text(
                              "Kayıt Olmak için tıklayınız.",
                              style: TextStyle(
                                  color: Color(0xFF6c63ff),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
