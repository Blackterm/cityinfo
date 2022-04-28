import 'package:cityinfo/domain/entities/user.dart' as ent;
import 'package:cityinfo/domain/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataUserRepository implements UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late ent.User currentUser;
  late DocumentSnapshot<Map<String, dynamic>> _documentSnapshot;

  @override
  Future<void> createUser(
      String firstName, String lastName, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      _firestore.collection("User").doc(userCredential.user!.uid).set({
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "uid": userCredential.user!.uid,
      });
    } catch (e, st) {
      print(e);
      print(st);
      throw ("already used");
    }
  }

  @override
  Future<ent.User> getCurrentUser() async {
    String uid = _auth.currentUser!.uid;
    print('Authenticated Uid: ' + uid);

    _documentSnapshot = await _firestore.collection('User').doc(uid).get();

    currentUser = ent.User.forumJson(_documentSnapshot);

    return currentUser;
  }

  @override
  Future<void> signInWithEmail(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
