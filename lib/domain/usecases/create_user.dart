import 'dart:async';
import 'package:cityinfo/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class CreatUser extends UseCase<void, CreateUserParams> {
  final UserRepository _userRepository;

  CreatUser(this._userRepository);
  @override
  Future<Stream<void>> buildUseCaseStream(CreateUserParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _userRepository.createUser(
          params!.firstName, params.lastName, params.email, params.password);
      controller.close();
    } catch (e, st) {
      print(e);
      print(st);
      controller.addError(e, st);
    }
    return controller.stream;
  }
}

class CreateUserParams {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  CreateUserParams(
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  );
}
