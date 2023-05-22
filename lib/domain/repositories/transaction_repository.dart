import 'package:finance_helper/domain/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> getTransactions();
}
