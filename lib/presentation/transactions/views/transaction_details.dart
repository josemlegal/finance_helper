import 'package:finance_helper/domain/transactions/models/transaction_model.dart';
import 'package:finance_helper/presentation/home/widgets/transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransactionDetails extends StatefulHookConsumerWidget {
  final Transaction transaction;

  const TransactionDetails({Key? key, required this.transaction})
      : super(key: key);

  @override
  ConsumerState<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends ConsumerState<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
      ),
      body: _TxDetailsWidget(widget.transaction),
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
  final Transaction transaction;

  const _TxDetailsWidget(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.access_time_filled),
          const SizedBox(height: 10),
          Text(transaction.description),
          const SizedBox(height: 10),
          const Text('Bought some food'),
          const SizedBox(height: 10),
          Text('${transaction.amount} Gs'),
          const SizedBox(height: 10),
          const Text('2021-10-10'),
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
