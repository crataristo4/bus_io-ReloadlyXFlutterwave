import 'package:bus_io/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final firestoreService = FirebaseFirestore.instance;
  static UserService? _instance;
  static String? uid;

  UserService._();

  static UserService get instance {
    if (FirebaseAuth.instance.currentUser != null) {
      uid = FirebaseAuth.instance.currentUser!.uid;
    }
    return _instance == null ? _instance = UserService._() : _instance!;
  }

//fetch all user
  Stream<Users> getUser() {
    return firestoreService
        .collection("Users")
        .doc(uid)
        .snapshots()
        .map((event) {
      return Users.fromJson(event.data()!);
    });
  }

  Stream<List<Users>> getUsers() {
    return firestoreService
        .collection('Users')
        .where('id', isEqualTo: uid)
        .limit(1)
        .snapshots()
        .map((snapshots) => snapshots.docs
            .map((document) => Users.fromJson(document.data()))
            .toList(growable: true))
        .handleError((error) {
      print(error);
    });
  }
}
