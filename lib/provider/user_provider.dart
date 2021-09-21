import 'package:bus_io/model/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  Users? _users;

  get getUser => _users;

  //notify listeners
  saveUserData(Users newUser) {
    _users = newUser;
    notifyListeners();
  }

  //create new user
  void createUser(BuildContext context) {
    print("get user ${_users!.email}");
  }
}
