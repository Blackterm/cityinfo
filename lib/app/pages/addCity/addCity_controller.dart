import 'package:cityinfo/app/pages/addCity/addCity_presenter.dart';
import 'package:cityinfo/app/pages/home/home_view.dart';
import 'package:cityinfo/domain/repositories/city_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';

class AddCityController extends Controller {
  final AddCityPresenter _presenter;

  AddCityController(CityRepository _cityRepository)
      : _presenter = AddCityPresenter(_cityRepository);

  var _uuid = Uuid();
  bool areFieldsIsEmpty = false;

  String? cityName;
  String? content;
  String? imageUrl;

  @override
  void initListeners() {
    _presenter.addCityOnComplate = () {
      Navigator.push(
        getContext(),
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ),
      );
    };

    _presenter.addCityOnError = (e) {
      showDialog(
          context: getContext(),
          builder: (getContext) => AlertDialog(
                title: Text("Something went wrong.Try again"),
                content: Lottie.asset(
                  'assets/animations/somethingWentWrong.json',
                ),
                //Text(e.message),
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

  void onCityNameChanged(String value) {
    cityName = value;
    checkFields();
    refreshUI();
  }

  void onContentChanged(String value) {
    content = value;
    checkFields();
    refreshUI();
  }

  void onImageUrlChanged(String value) {
    imageUrl = value;
    checkFields();
    refreshUI();
  }

  void addCity() {
    _presenter.addCity(cityName!, content!, imageUrl!, _uuid.v1().toString());
    refreshUI();
  }

  void checkFields() {
    if ((cityName != null && content != null && imageUrl != null) &&
        (cityName != "" && content != "" && imageUrl != "")) {
      areFieldsIsEmpty = true;
    } else {
      areFieldsIsEmpty = false;
    }
  }
}
