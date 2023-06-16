import 'package:finance_helper/core/dependency_injection/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewController extends ChangeNotifier {
  final NavigationService _navigationService;

  HomeViewController({
    required NavigationService navigationService,
  }) : _navigationService = navigationService;

  bool isLoading = true;

  String? textInputEmptyValidator(value) {
    if (value!.isEmpty) {
      return 'El campo esta vacio';
    } else {
      return null;
    }
  }

  void goToLoginView() {
    _navigationService.pushNamedAndRemoveUntil('/login-view');
  }
}

final homeViewProvider = ChangeNotifierProvider(
  (ref) => HomeViewController(
    navigationService: locator<NavigationService>(),
  ),
);
