import 'package:cityinfo/domain/entities/city.dart';

abstract class CityRepository {
  Stream<List<City>> getCities();
  Future<void> addCity(
      String cityName, String content, String imageUrl, String uid);
  Future<void> removeCity(String uid);
}
