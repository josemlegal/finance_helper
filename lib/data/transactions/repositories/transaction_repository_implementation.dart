import 'package:dio/dio.dart';
import 'package:finance_helper/core/error/error_handling.dart';
import 'package:finance_helper/core/services/http_service.dart';
import 'package:finance_helper/domain/transactions/models/transaction_model.dart';
import 'package:finance_helper/domain/transactions/repositories/transaction_repository.dart';

class TransactionRepositoryImplementation implements TransactionRepository {
  final HttpService _httpService;

  TransactionRepositoryImplementation({required HttpService httpService})
      : _httpService = httpService;

  final List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  @override
  Future<List<Transaction>> getTransactions() {
    return _call(() async {
      final response = await _httpService.dio.get("/api/transaction");

      return (response.data as List)
          .map((transactions) => Transaction.fromJson(transactions))
          .toList();
    }, errorMessage: "Could not get transactions.");
  }
}

Future<T> _call<T>(Future<T> Function() function,
    {String? errorMessage}) async {
  try {
    return await function();
  } on DioError catch (err) {
    throw CustomErrorHandler.fromDioError(
      err: err,
      errorMessage:
          errorMessage ?? "Something went wrong, please try again later.",
    );
  } catch (err) {
    throw CustomErrorHandler.fromGenericError(message: err.toString());
  }
}
