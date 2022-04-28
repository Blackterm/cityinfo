import 'package:cloud_firestore/cloud_firestore.dart';

class City {
  final String uid;
  final String cityName;
  final String content;
  final String imageUrl;

  City({
    required this.uid,
    required this.cityName,
    required this.content,
    required this.imageUrl,
  });

  City.fromJson(DocumentSnapshot<Map<String, dynamic>> json)
      : uid = json.id,
        cityName = json["cityName"],
        content = json["content"],
        imageUrl = json["imageUrl"];
  Map<String, dynamic> toJson() {
    return {
      "cityName": cityName,
      "content": content,
      "imageUrl": imageUrl,
    };
  }
}
