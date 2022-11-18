import 'package:banking_app/core/error/failure.dart';
import 'package:banking_app/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseBankRepository{
 Future<Either<Failure,Database>>  createBankDb();
 Future<Either<Failure,int>>  addUserToBankDb(String name,String email,String transferFrom,String transferTo,int total);
 Future<Either<Failure, List<User>>>  getAllUserFromDataBase();
 Future<Either<Failure,int>>  updateUserInBankDb(int status ,int id);

}