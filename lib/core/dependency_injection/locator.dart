import 'package:finance_helper/core/services/http_service.dart';
import 'package:finance_helper/data/transactions/repositories/transaction_repository_implementation.dart';
import 'package:finance_helper/domain/transactions/repositories/transaction_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<HttpService>(
    () => HttpService(),
  );

  locator.registerLazySingleton<NavigationService>(
    () => NavigationService(),
  );

  locator.registerLazySingleton<DialogService>(
    () => DialogService(),
  );

  locator.registerLazySingleton<SnackbarService>(
    () => SnackbarService(),
  );

  locator.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImplementation(
        httpService: locator<HttpService>()),
  );
}
