import 'dart:async';

import 'package:cityinfo/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SignInWithEmail extends UseCase<void, SignInWithEmailParams> {
  final UserRepository _userRepository;

  SignInWithEmail(this._userRepository);
  @override
  Future<Stream<void>> buildUseCaseStream(SignInWithEmailParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _userRepository.signInWithEmail(params!.email, params.password);
      controller.close();
    } catch (e, st) {
      print(e);
      print(st);
      controller.addError(e, st);
    }
    return controller.stream;
  }
}

class SignInWithEmailParams {
  final String email;
  final String password;

  SignInWithEmailParams(this.email, this.password);
}
