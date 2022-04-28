import 'dart:async';

import 'package:cityinfo/domain/repositories/city_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddCity extends UseCase<void, AddCityParams> {
  final CityRepository _cityRepository;

  AddCity(this._cityRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(AddCityParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _cityRepository.addCity(
          params!.cityName, params.content, params.imageUrl, params.uid);
      controller.close();
    } catch (e, st) {
      print(e);
      print(st);
      controller.addError(e, st);
    }
    return controller.stream;
  }
}

class AddCityParams {
  String cityName;
  String content;
  String imageUrl;
  String uid;

  AddCityParams(
    this.cityName,
    this.content,
    this.imageUrl,
    this.uid,
  );
}
