// ignore_for_file: camel_case_types, must_be_immutable

import 'package:equatable/equatable.dart';


abstract class BankEvent extends Equatable{
  const BankEvent();

  @override
  List<Object> get props=> [];
}
class CreateDatabaseEvent extends BankEvent{ }
class GetalluserFromDatabaseEvent extends BankEvent{ }
class GetValueOfComboBoxEvent extends BankEvent{
  final String name;
  const GetValueOfComboBoxEvent(this.name);
}
class ChangeBottomNavBarEvent extends BankEvent{
   int currentIndex;
   ChangeBottomNavBarEvent({required this.currentIndex});
}
class AddUserToDatabaseEvent extends BankEvent{
 final String name;
 final String email;
 final String transferFrom;
 final String transferTo;
 final int total;
  const AddUserToDatabaseEvent(
      {required this.name, required this.email, required this.transferFrom, required this.transferTo,required this.total});
}
class UpdateUserInDataBaseEvent extends BankEvent{
  final int id;
  final int status;

  const UpdateUserInDataBaseEvent({required this.id,required this.status});
}
