import 'package:finance_helper/domain/transactions/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> getTransactions();
}
