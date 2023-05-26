import 'package:finance_helper/core/utils/date_parser.dart';
import 'package:finance_helper/domain/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListOfTransactions extends StatelessWidget {
  final List<Transaction> transactions;

  const ListOfTransactions({Key? key, required this.transactions})
      : super(key: key);

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
              context.push('/transaction-details');
            },
          )
      ],
    );
  }
}
