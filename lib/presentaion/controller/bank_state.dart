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


  const BankState(
      {this.changeBottomState = RequestState.loading,
      this.updateUser = 0,
      this.updateUserMessage = '',
      this.updateUserState = RequestState.loading,
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
  BankState copyWith({
    Database? createDb,
    RequestState? createDbState,
    String? createDbMessage,
    List<User>? allUser,
    RequestState? getAllUserState,
    String? getAllUserMessage,
    int? addUser,
    RequestState? addUserState,
    String? addUserMessage,
    int? updateUser,
    RequestState? updateUserState,
    String? updateUserMessage,
    int? currentIndex,
    RequestState? changeBottomState,
  }) {
    return BankState(
        changeBottomState: changeBottomState ?? this.changeBottomState,
        updateUser: updateUser ?? this.updateUser,
        updateUserMessage: updateUserMessage ?? this.updateUserMessage,
        updateUserState: updateUserState ?? this.updateUserState,
        currentIndex: currentIndex ?? this.currentIndex,
        createDb: createDb ?? this.createDb,
        createDbState: createDbState ?? this.createDbState,
        createDbMessage: createDbMessage ?? this.createDbMessage,
        allUser: allUser ?? this.allUser,
        getAllUserMessage: getAllUserMessage ?? this.getAllUserMessage,
        getAllUserState: getAllUserState ?? this.getAllUserState,
        addUser: addUser ?? this.addUser,
        addUserMessage: addUserMessage ?? this.addUserMessage,
        addUserState: addUserState ?? this.addUserState);
  }

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
        updateUser,
        updateUserMessage,
        updateUserState,
        // screens,
      ];
}
