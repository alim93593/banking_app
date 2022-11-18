// ignore_for_file: avoid_print, unnecessary_string_interpolations

import 'package:banking_app/core/utils/constant.dart';
import 'package:banking_app/data/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseBankLocalDataSource{
  Database? databaseMain;
  Future <Database> createDataBase();
  Future <List<UserModel>> getAllUserFromDataBase();
  Future<int> addUserToBankDb(String name,String email,String transferFrom,String transferTo,int total);
  Future<int> updateUserInBankDb(int status,int id);
}
class BankLocalDataSource extends BaseBankLocalDataSource{

  @override
  Future <List<UserModel>> getAllUserFromDataBase()async {
    var db = await openDatabase('bank.db');
      final response =  await db.rawQuery('SELECT * FROM $tableName');
      if(response.isNotEmpty){
        return List<UserModel>.from(
            (response.map((e) => UserModel.fromJson(e))));
      }else {
        return [];
        // throw const LocalDatabaseException(message: 'Error when Get Records');
      }

  }
  @override
  Future<Database> createDataBase()async {
    return await openDatabase(
        databaseName,
        version: 1,
        onCreate: (database, version) async {
          print('database created');
          await database.execute(
              'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,name TEXT,email TEXT,transferfrom TEXT,transferto TEXT, total INTEGER)')
              .then((value) {
            print('table has been created');
          }).catchError((error) {
            print('Error When Creating Table${error.toString()}');
          });
        },
        onOpen: (database) {
          databaseMain = database;
          print('database opend');
        }).then((value) {
          print('hello from database');
      return databaseMain = value;
    });
  }
  @override
  Future<int> addUserToBankDb(String name,String email,String transferFrom,String transferTo,int total)async {
    var db = await openDatabase('bank.db');
    return await db.transaction((txn) async {
      int id = await txn.rawInsert(
          'INSERT INTO $tableName(name, email,transferfrom,transferto,total) VALUES("$name","$email","$transferFrom","$transferTo","$total")');
      print(id.toString());
      return id;
    });
  }

  @override
  Future<int> updateUserInBankDb(int status,int id) async{
    var db = await openDatabase('bank.db');
    int id1 =  await   db.rawUpdate('UPDATE user Set total = ? WHERE id=?',
        ['$status', id]);
    print(id1.toString());
    return id1;

  }
}