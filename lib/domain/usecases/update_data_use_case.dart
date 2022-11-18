import 'package:banking_app/core/error/failure.dart';
import 'package:banking_app/domain/repository/base_bank_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateDataBaseUseCase{
  final BaseBankRepository bankRepository;

  UpdateDataBaseUseCase(this.bankRepository);
  Future<Either<Failure,int>> execute( int status,int id)async{
    return await bankRepository.updateUserInBankDb(status,id);
  }
}