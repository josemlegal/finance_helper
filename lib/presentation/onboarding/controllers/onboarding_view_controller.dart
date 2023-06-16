import 'package:finance_helper/core/dependency_injection/locator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewController extends ChangeNotifier {
  final NavigationService _navigationService;

  OnboardingViewController({required NavigationService navigationService})
      : _navigationService = navigationService;

  void navigateToLogin() {
    _navigationService.navigateTo('/login-view');
  }
}

final onboardingProvider = ChangeNotifierProvider(
  (ref) => OnboardingViewController(
    navigationService: locator<NavigationService>(),
  ),
);
