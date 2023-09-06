import 'package:flutter/material.dart';

import '../data_utils/data_utils.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  late List<UserModel> _userList = [];

  List<UserModel> get allUserList => _userList;
  bool isLoading = false;

  void fetchPost() async {
    isLoading = true;
    try {
      DataUtil dataUser = DataUtil();
      _userList = await dataUser.getData();
      isLoading = false;
    } catch (e) {
      isLoading = false;
    }
    notifyListeners();
  }
}

// user provider file to play with the api file
