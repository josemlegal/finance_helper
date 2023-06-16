import 'package:finance_helper/core/dependency_injection/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void setupSnackbarUi() {
  var snackBarService = locator<SnackbarService>();

  snackBarService.registerSnackbarConfig(
    SnackbarConfig(
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
      titleColor: Colors.black,
      borderColor: Colors.white,
      messageColor: Colors.grey,
    ),
  );
}
