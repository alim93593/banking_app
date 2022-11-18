import 'package:banking_app/core/error/failure.dart';
import 'package:banking_app/domain/entities/user.dart';
import 'package:banking_app/domain/repository/base_bank_repository.dart';
import 'package:dartz/dartz.dart';


class GetAllUserFromDataBaseUseCase{
  final BaseBankRepository bankRepository;

  GetAllUserFromDataBaseUseCase(this.bankRepository);
  Future<Either<Failure,List<User>>> execute()async{
    return await bankRepository.getAllUserFromDataBase();
  }

}