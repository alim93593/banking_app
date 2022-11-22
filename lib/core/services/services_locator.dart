import 'package:banking_app/data/datasource/bank_local_datasource.dart';
import 'package:banking_app/data/repository/bank_repository.dart';
import 'package:banking_app/domain/repository/base_bank_repository.dart';
import 'package:banking_app/domain/usecases/add_user_to_bankdb_usecase.dart';
import 'package:banking_app/domain/usecases/create_data_base_usecase.dart';
import 'package:banking_app/domain/usecases/get_data_from_data_base_usecase.dart';
import 'package:banking_app/domain/usecases/update_data_use_case.dart';
import 'package:get_it/get_it.dart';

import '../../presentaion/controller/bank_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
   //// Bloc
    sl.registerFactory(
      () => BankBloc(
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
    //// UseCases
    sl.registerLazySingleton(() => CreateBankDbUseCase(sl()));
    sl.registerLazySingleton(() => GetAllUserFromDataBaseUseCase(sl()));
    sl.registerLazySingleton(() => AddUserToBankDbUseCase(sl()));
    sl.registerLazySingleton(() => UpdateDataBaseUseCase(sl()));
    //// Repository
    sl.registerLazySingleton<BaseBankRepository>(() => BankRepository(sl()));
    //// DATA SOURCE
    sl.registerLazySingleton<BaseBankLocalDataSource>(
        () => BankLocalDataSource());
  }
}
