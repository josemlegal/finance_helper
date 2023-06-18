import 'package:finance_helper/domain/transactions/models/transaction_model.dart';
import 'package:flutter/material.dart';

class ListOfTransactions extends StatelessWidget {
  final List<Transaction> transactions;
  final Function? callback;

  const ListOfTransactions({
    Key? key,
    required this.transactions,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (Transaction transaction in transactions)
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
              print(transaction);
              if (callback != null) callback!(transactions);
            },
          )
      ],
    );
  }
}
