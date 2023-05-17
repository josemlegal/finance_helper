import 'package:finance_helper/domain/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginViewController extends ChangeNotifier {
  LoginViewController();

  bool isLoading = true;
  User? _currentUser;

  User? get currentUser => _currentUser;

  String? textInputEmptyValidator(value) {
    if (value!.isEmpty) {
      return 'El campo esta vacio';
    } else {
      return null;
    }
  }
}

final loginViewControllerProvider = ChangeNotifierProvider(
  (ref) => LoginViewController(),
);
