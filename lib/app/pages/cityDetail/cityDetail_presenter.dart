import 'package:cityinfo/domain/repositories/city_repository.dart';
import 'package:cityinfo/domain/usecases/remove_city.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class CityDetailPresenter extends Presenter {
  late Function removeCityOnComplate;
  late Function removeCityOnError;

  final RemoveCity _removeCity;

  CityDetailPresenter(CityRepository _cityRepository)
      : _removeCity = RemoveCity(_cityRepository);

  @override
  void dispose() {
    _removeCity.dispose();
  }

  void removeCity(String uid) {
    _removeCity.execute(_RemoveCityObserver(this), RemoveCityParams(uid));
  }
}

class _RemoveCityObserver extends Observer<void> {
  final CityDetailPresenter _presenter;

  _RemoveCityObserver(this._presenter);
  @override
  void onComplete() {
    _presenter.removeCityOnComplate();
  }

  @override
  void onError(e) {
    _presenter.removeCityOnError(e);
  }

  @override
  void onNext(_) {}
}
