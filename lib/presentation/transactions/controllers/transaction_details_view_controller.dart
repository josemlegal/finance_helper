import 'package:finance_helper/core/dependency_injection/locator.dart';
import 'package:finance_helper/domain/transactions/models/transaction_model.dart';
import 'package:finance_helper/domain/transactions/repositories/transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked_services/stacked_services.dart';

class TransactionViewController extends ChangeNotifier {
  final NavigationService _navigationService;

  final List<Transaction> _transactions = [];
  List<Transaction> get transactions => _transactions;

  TransactionViewController({
    required TransactionRepository transactionRepository,
    required NavigationService navigationService,
  }) : _navigationService = navigationService;

  void goToTransactionDetails({Transaction? transaction}) async {
    await _navigationService.navigateTo('/transaction-detail', arguments: {
      'transaction': transaction,
    });
    notifyListeners();
  }
}

final transactionsDetailsProvider = ChangeNotifierProvider(
  (ref) => TransactionViewController(
    navigationService: locator<NavigationService>(),
    transactionRepository: locator<TransactionRepository>(),
  ),
);
