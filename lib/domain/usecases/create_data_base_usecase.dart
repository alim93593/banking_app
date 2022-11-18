import 'package:banking_app/core/error/failure.dart';
import 'package:banking_app/domain/repository/base_bank_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqlite_api.dart';

class CreateBankDbUseCase{
  final BaseBankRepository bankRepository;
  CreateBankDbUseCase(this.bankRepository);
  Future<Either<Failure,Database>> execute()async{
    return await bankRepository.createBankDb();
  }

}