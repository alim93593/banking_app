import 'package:banking_app/core/utils/enums.dart';
import 'package:banking_app/domain/entities/user.dart';
import 'package:equatable/equatable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class BankState extends Equatable {
  final Database? createDb;
  final RequestState createDbState;
  final String createDbMessage;

  final List<User> allUser;
  final RequestState getAllUserState;
  final String getAllUserMessage;

  final int addUser;
  final RequestState addUserState;
  final String addUserMessage;

  final int updateUser;
  final RequestState updateUserState;
  final String updateUserMessage;

  final int currentIndex;
  final RequestState changeBottomState;
  final String name;
  final RequestState selectNameValueState;

  const BankState(
      {this.changeBottomState = RequestState.loading,
      this.updateUser = 0,
      this.updateUserMessage = '',
      this.updateUserState = RequestState.loading,
      this.name = "",
      this.selectNameValueState = RequestState.loading,
      // this.screens=const[BankUserScreen(),UserTransferDataScreen(),UserTransferDataScreen(),],
      this.currentIndex = 0,
      this.createDb,
      this.createDbState = RequestState.loading,
      this.createDbMessage = '',
      this.allUser = const [],
      this.getAllUserMessage = '',
      this.getAllUserState = RequestState.loading,
      this.addUser = 0,
      this.addUserMessage = '',
      this.addUserState = RequestState.loading});
  @override
  List<Object?> get props => [
        createDb,
        createDbState,
        createDbMessage,
        allUser,
        getAllUserMessage,
        getAllUserState,
        addUser,
        addUserMessage,
        addUserState,
        currentIndex,
        name,
        selectNameValueState,
        updateUser,
        updateUserMessage,
        updateUserState,
        // screens,
      ];
}
