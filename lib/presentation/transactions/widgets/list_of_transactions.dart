import 'package:finance_helper/core/utils/date_parser.dart';
import 'package:finance_helper/domain/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListOfTransactions extends StatelessWidget {
  ListOfTransactions({super.key});

  final List<Transaction> transactions = [
    Transaction(
      id: 1,
      category: 'Supermercado',
      descrption: 'Bought some food',
      amount: 10000,
      icon: Icons.access_time_filled,
      createAt: DateTime.now(),
    ),
    Transaction(
      id: 2,
      category: 'Alquiler',
      descrption: 'Bought some food',
      amount: 10000,
      icon: Icons.food_bank,
      createAt: DateTime.now(),
    ),
    Transaction(
      id: 3,
      category: 'Farmacia',
      descrption: 'Bought some food',
      amount: 10000,
      icon: Icons.food_bank,
      createAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (Transaction transaction in transactions)
          ListTile(
            visualDensity: VisualDensity.standard,
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(transaction.icon),
              ],
            ),
            title: Text(transaction.category),
            subtitle: Text(
                "${dateParser(transaction.createAt)} \nGs. ${transaction.amount}"),
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
