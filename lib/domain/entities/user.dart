import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String firstName;
  final String lastName;

  User({
    required this.uid,
    required this.firstName,
    required this.lastName,
  });

  User.forumJson(DocumentSnapshot<Map<String, dynamic>> json)
      : uid = json.id,
        firstName =
            json["firstName"] == null ? "" : json["firstName"] as String,
        lastName = json['lastName'] == null ? '' : json['lastName'] as String;
}
