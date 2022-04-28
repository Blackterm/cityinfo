import 'package:cityinfo/domain/repositories/user_repository.dart';
import 'package:cityinfo/domain/usecases/create_user.dart';
import 'package:cityinfo/domain/usecases/sign_in_with_email.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class RegisterPresenter extends Presenter {
  late Function createUserOnComplete;
  late Function createUserOnError;

  late Function signWithEmailOnComplete;
  late Function signInWithEmailOnError;

  final SignInWithEmail _signInWithEmail;
  final CreatUser _creatUser;

  RegisterPresenter(UserRepository _userRepository)
      : _creatUser = CreatUser(_userRepository),
        _signInWithEmail = SignInWithEmail(_userRepository);

  @override
  void dispose() {
    _creatUser.dispose();
    _signInWithEmail.dispose();
  }

  void createUser(
      String firstName, String lastName, String email, String password) {
    _creatUser.execute(CreateUserObserver(this),
        CreateUserParams(firstName, lastName, email, password));
  }

  void signInWithEmail(String email, String password) {
    _signInWithEmail.execute(
        _SignInWithEmailObserver(this), SignInWithEmailParams(email, password));
  }
}

class CreateUserObserver extends Observer<void> {
  final RegisterPresenter _presenter;

  CreateUserObserver(this._presenter);
  @override
  void onComplete() {
    _presenter.createUserOnComplete();
  }

  @override
  void onError(e) {
    _presenter.createUserOnError(e);
  }

  @override
  void onNext(_) {}
}

class _SignInWithEmailObserver extends Observer<void> {
  final RegisterPresenter _presenter;

  _SignInWithEmailObserver(this._presenter);
  @override
  void onComplete() {
    _presenter.signWithEmailOnComplete();
  }

  @override
  void onError(e) {
    _presenter.signInWithEmailOnError(e);
  }

  @override
  void onNext(_) {}
}
