// ignore_for_file: unused_import, avoid_print

import 'package:banking_app/core/error/exceptions.dart';
import 'package:banking_app/core/error/failure.dart';
import 'package:banking_app/data/datasource/bank_local_datasource.dart';
import 'package:banking_app/data/model/user_model.dart';
import 'package:banking_app/domain/entities/user.dart';
import 'package:banking_app/domain/repository/base_bank_repository.dart';
import 'package:dartz/dartz.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite_common/sqlite_api.dart';

class BankRepository extends BaseBankRepository {
  final BaseBankLocalDataSource baseBankLocalDataSource;
  BankRepository(this.baseBankLocalDataSource);
  @override
  Future<Either<Failure, Database>> createBankDb()async  {
    final result = await  baseBankLocalDataSource.createDataBase();
    try {
      return Right(result);
    } on DatabaseException catch (failure) {
      return Left(DataBaseFailure(failure.toString()));
    }
  }
  @override
  Future<Either<Failure, List<UserModel>>> getAllUserFromDataBase()async {
    final result = await  baseBankLocalDataSource.getAllUserFromDataBase();
    try {
      return Right(result);
    } on LocalDatabaseException catch (failure) {
      return Left(DataBaseFailure(failure.toString()));
    }
  }
  @override
  Future<Either<Failure,int>> addUserToBankDb(String name,String email,String transferFrom,String transferTo,int total)async {
    final result = await  baseBankLocalDataSource.addUserToBankDb(name,email,transferFrom,transferTo,total);
    try {
      print(result);
      return Right(result);
    } on DatabaseException catch (failure) {
      return Left(DataBaseFailure(failure.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> updateUserInBankDb(int status,int id)async {
    final result = await  baseBankLocalDataSource.updateUserInBankDb(status,id);
    try {
      print(result);
      return Right(result);
    } on DatabaseException catch (failure) {
      return Left(DataBaseFailure(failure.toString()));
    }
  }

}
