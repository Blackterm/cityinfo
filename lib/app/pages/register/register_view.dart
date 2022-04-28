import 'package:cityinfo/app/pages/register/register_controller.dart';
import 'package:cityinfo/data/repositories/data_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class RegisterView extends View {
  @override
  State<StatefulWidget> createState() {
    return _RegisterViewState(
      RegisterController(
        DataUserRepository(),
      ),
    );
  }
}

class _RegisterViewState extends ViewState<RegisterView, RegisterController> {
  _RegisterViewState(RegisterController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: globalKey,
      body: ControlledWidgetBuilder<RegisterController>(
        builder: (context, controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Column(
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
                        child: Image.asset("assets/image/Login-image.png")),
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
                          hintText: "  " + 'Email Adresiniz',
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
                        //obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) =>
                            {controller.onPasswordTextChanged(value)},
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "  " + 'Şifreniz',
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
                        keyboardType: TextInputType.name,
                        onChanged: (value) =>
                            {controller.onFirstNameTextChanged(value)},
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "  " + 'Adınız',
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
                        keyboardType: TextInputType.name,
                        onChanged: (value) =>
                            {controller.onLastNameChanged(value)},
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "  " + 'Soyadınız',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                        onTap: () {
                          controller.areFieldsIsEmpty
                              ? controller.createUser()
                              : null;
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
                              "Kayıt Ol",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
