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

    final transactions = transactionsViewController.transactions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : ListOfTransactions(
                transactions: transactions,
                onPressed: transactionsViewController.goToTransactionDetails,
              ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () => print(transactions)),
    );
  }
}
