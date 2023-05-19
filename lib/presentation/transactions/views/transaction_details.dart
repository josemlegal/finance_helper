import 'package:flutter/material.dart';

class TransactionDetails extends StatelessWidget {
  static const name = '/transaction-details';
  const TransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
      ),
      body: const Center(
        child: Text('Transaction Details'),
      ),
    );
  }
}
