import 'package:finance_helper/presentation/home/widgets/transaction_form.dart';
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
      body: const _TxDetailsWidget(),
      floatingActionButton: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _EditFloatingActionButton(),
          SizedBox(height: 10),
          _DeleteFloatingActionButton()
        ],
      ),
    );
  }
}

class _TxDetailsWidget extends StatelessWidget {
  const _TxDetailsWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.access_time_filled),
          SizedBox(height: 10),
          Text('Supermercado'),
          SizedBox(height: 10),
          Text('Bought some food'),
          SizedBox(height: 10),
          Text('Gs. 10000'),
          SizedBox(height: 10),
          Text('2021-10-10'),
        ],
      ),
    );
  }
}

class _EditFloatingActionButton extends StatelessWidget {
  const _EditFloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'edit',
      backgroundColor: Colors.teal,
      child: const Icon(Icons.edit),
      onPressed: () {
        showModalBottomSheet(
          // TODO: Edit Transaction
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return TransactionForm();
          },
        );
      },
    );
  }
}

class _DeleteFloatingActionButton extends StatelessWidget {
  const _DeleteFloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'delete',
      backgroundColor: Colors.red,
      child: const Icon(Icons.delete),
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              actionsAlignment: MainAxisAlignment.end,
              contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              title: const Text(
                'Desear eliminar este movimiento?',
                textAlign: TextAlign.center,
              ),
              content: const Text(
                'Si eliminas este movimiento no podras recuperarlo.',
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Eliminar'),
                  onPressed: () {
                    // TODO: Delete Transaction
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
