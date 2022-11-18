import 'package:banking_app/core/error/failure.dart';
import 'package:banking_app/domain/repository/base_bank_repository.dart';
import 'package:dartz/dartz.dart';

class AddUserToBankDbUseCase{
 final BaseBankRepository bankRepository;

  AddUserToBankDbUseCase(this.bankRepository);
 Future<Either<Failure,int>> execute(String name,String email,String transferFrom,String transferTo,int total)async{
    return await bankRepository.addUserToBankDb(name, email,transferFrom,transferTo,total);
  }

}