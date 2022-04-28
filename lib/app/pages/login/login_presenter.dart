import 'package:cityinfo/domain/repositories/user_repository.dart';
import 'package:cityinfo/domain/usecases/sign_in_with_email.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginPresenter extends Presenter {
  late Function singWithEmailOnComplate;
  late Function singWithEmailOnError;

  final SignInWithEmail _signInWithEmail;

  LoginPresenter(UserRepository _userRepository)
      : _signInWithEmail = SignInWithEmail(_userRepository);

  @override
  void dispose() {
    _signInWithEmail.dispose();
  }

  void signInWithEmail(String email, String password) {
    _signInWithEmail.execute(
        _SignInWithEmailObserver(this), SignInWithEmailParams(email, password));
  }
}

class _SignInWithEmailObserver extends Observer<void> {
  final LoginPresenter _presenter;

  _SignInWithEmailObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.singWithEmailOnComplate();
  }

  @override
  void onError(e) {
    _presenter.singWithEmailOnError(e);
  }

  @override
  void onNext(_) {}
}
