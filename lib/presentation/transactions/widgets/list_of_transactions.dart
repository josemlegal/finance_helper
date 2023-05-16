import 'package:flutter/material.dart';

class ListOfTransactions extends StatelessWidget {
  ListOfTransactions({super.key});

  final mockData = [
    {
      'id': 1,
      'title': 'Supermercado',
      'subtitle': 'Compra de la semana',
      'amount': 1000,
      'icon': Icons.money,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.money,
            color: Colors.green,
          ),
          title: Text('Supermercado'),
          subtitle: Text('Compra de la semana'),
          trailing: Icon(
            Icons.arrow_downward_outlined,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
