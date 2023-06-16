import 'package:finance_helper/domain/transactions/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListOfTransactions extends StatefulHookConsumerWidget {
  final List<Transaction> transactions;
  final VoidCallback onPressed;

  const ListOfTransactions({
    Key? key,
    required this.transactions,
    required this.onPressed,
  }) : super(key: key);

  @override
  ConsumerState<ListOfTransactions> createState() => _ListOfTransactionsState();
}

class _ListOfTransactionsState extends ConsumerState<ListOfTransactions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (Transaction transaction in widget.transactions)
          ListTile(
            visualDensity: VisualDensity.standard,
            // leading: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Icon(transaction.icon),
            //   ],
            // ),
            title: Text(
              transaction.description,
            ),
            subtitle:
                Text("${transaction.description} \nGs. ${transaction.amount}"),
            isThreeLine: true,
            dense: true,
            trailing: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            onTap: () {
              widget.onPressed();
            },
          )
      ],
    );
  }
}
