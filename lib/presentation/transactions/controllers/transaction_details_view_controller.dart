import 'package:finance_helper/core/dependency_injection/locator.dart';
import 'package:finance_helper/domain/transactions/models/transaction_model.dart';
import 'package:finance_helper/domain/transactions/repositories/transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked_services/stacked_services.dart';

class TransactionViewController extends ChangeNotifier {
  final TransactionRepository _transactionRepository;
  final SnackbarService _snackbarService;
  final NavigationService _navigationService;

  List<Transaction> _transactions = [];
  List<Transaction> get transactions => _transactions;

  TransactionViewController({
    required TransactionRepository transactionRepository,
    required SnackbarService snackbarService,
    required NavigationService navigationService,
  })  : _transactionRepository = transactionRepository,
        _snackbarService = snackbarService,
        _navigationService = navigationService;

  void _handleError({String? title, String? message}) {
    if (title != null && message != null) {
      _snackbarService.showSnackbar(
        title: title,
        message: message,
      );
    } else {
      _snackbarService.showSnackbar(
        title: "Something went wrong.",
        message: "Please try again later.",
      );
    }
  }

  void goToTransactionDetails({Transaction? transaction}) async {
    await _navigationService.navigateTo('/transaction-detail', arguments: {
      'transaction': transaction,
    });
    print(transaction);
    notifyListeners();
  }
}

final transactionsDetailsProvider = ChangeNotifierProvider(
  (ref) => TransactionViewController(
    snackbarService: locator<SnackbarService>(),
    navigationService: locator<NavigationService>(),
    transactionRepository: locator<TransactionRepository>(),
  ),
);
