import 'package:finance_helper/presentation/transactions/controllers/transactions_view_controller.dart';
import 'package:finance_helper/presentation/transactions/widgets/list_of_transactions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransactionsView extends StatefulHookConsumerWidget {
  const TransactionsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionsViewState();
}

class _TransactionsViewState extends ConsumerState<TransactionsView> {
  bool isLoading = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(transactionsProvider).fetchStates();
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final transactionsViewController = ref.read(transactionsProvider);

    final transactionList =
        ref.watch(transactionsProvider.select((value) => value.transactions));

    final transactions = transactionList.length > 2
        ? transactionList.sublist(0, 3)
        : transactionList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : ListOfTransactions(
                transactions: transactionsViewController.transactions,
                callback: (transaction) {
                  transactionsViewController.goToTransactionDetails(
                      transaction: transaction[0]);
                },
              ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () => print(transactions.toList())),
    );
  }
}
