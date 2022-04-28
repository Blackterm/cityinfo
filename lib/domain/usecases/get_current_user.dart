import 'dart:async';

import 'package:cityinfo/domain/entities/user.dart';
import 'package:cityinfo/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetCurrentUser extends UseCase<User, void> {
  final UserRepository _userRepository;

  GetCurrentUser(this._userRepository);

  @override
  Future<Stream<User?>> buildUseCaseStream(void params) async {
    StreamController<User> controller = StreamController();

    try {
      User currentUser = await _userRepository.getCurrentUser();
      controller.add(currentUser);
      controller.close();
    } catch (e, st) {
      print(e);
      print(st);
      controller.addError(e, st);
    }
    return controller.stream;
  }
}
