import 'package:finance_helper/core/dependency_injection/locator.dart';
import 'package:finance_helper/domain/models/transaction_model.dart';
import 'package:finance_helper/domain/repositories/transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked_services/stacked_services.dart';

class TransactionViewController extends ChangeNotifier {
  final TransactionRepository _transactionRepository;
  // final SnackbarService _snackbarService;

  List<Transaction> _transactions = [];
  List<Transaction> get transactions => _transactions;

  TransactionViewController({
    required TransactionRepository transactionRepository,
    required SnackbarService snackbarService,
  }) : _transactionRepository = transactionRepository;
  // _snackbarService = snackbarService;

  // void _handleError({String? title, String? message}) {
  //   if (title != null && message != null) {
  //     _snackbarService.showSnackbar(
  //       title: title,
  //       message: message,
  //     );
  //   } else {
  //     _snackbarService.showSnackbar(
  //       title: "Something went wrong.",
  //       message: "Please try again later.",
  //     );
  //   }
  // }

  Future<void> getTransactions() async {
    try {
      // print('me ejecute en el controller');
      final response = await _transactionRepository.getTransactions();
      // print('me ejecute despues del response en el controller');
      _transactions = response;
      notifyListeners();
    } catch (err) {
      // print(err.toString());

      // _handleError(
      //     title: "Could not get transactions.", message: err.toString());
    }
  }

  Future<void> fetchStates() async {
    await getTransactions();
  }
}

final transactionsProvider = ChangeNotifierProvider(
  (ref) => TransactionViewController(
    snackbarService: locator<SnackbarService>(),
    transactionRepository: locator<TransactionRepository>(),
  ),
);
