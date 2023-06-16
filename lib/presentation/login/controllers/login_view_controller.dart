import 'package:finance_helper/core/dependency_injection/locator.dart';
import 'package:finance_helper/domain/user/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewController extends ChangeNotifier {
  final NavigationService _navigationService;
  LoginViewController({
    required NavigationService navigationService,
  }) : _navigationService = navigationService;

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

  void goToHomeView() {
    _navigationService.pushNamedAndRemoveUntil('/home-view');
  }
}

final loginViewProvider = ChangeNotifierProvider(
  (ref) => LoginViewController(
    navigationService: locator<NavigationService>(),
  ),
);
