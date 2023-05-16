import 'package:finance_helper/presentation/transactions/widgets/list_of_transactions.dart';
import 'package:flutter/material.dart';

class TransactionsView extends StatelessWidget {
  static const String name = '/transactions-view';
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: Center(
        child: ListOfTransactions(),
      ),
    );
  }
}
