import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewController extends ChangeNotifier {
  HomeViewController();

  bool isLoading = true;

  String? textInputEmptyValidator(value) {
    if (value!.isEmpty) {
      return 'El campo esta vacio';
    } else {
      return null;
    }
  }
}

final homeViewProvider = ChangeNotifierProvider(
  (ref) => HomeViewController(),
);
