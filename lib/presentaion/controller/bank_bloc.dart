// ignore_for_file: avoid_print, unused_import, unnecessary_null_comparison, invalid_use_of_visible_for_testing_member

import 'package:banking_app/core/utils/enums.dart';
import 'package:banking_app/domain/usecases/add_user_to_bankdb_usecase.dart';
import 'package:banking_app/domain/usecases/get_data_from_data_base_usecase.dart';
import 'package:banking_app/domain/usecases/update_data_use_case.dart';
import 'package:banking_app/presentaion/controller/bank_event.dart';
import 'package:banking_app/presentaion/controller/bank_state.dart';
import 'package:banking_app/presentaion/screens/bank_user_data/user_transfer_data_screen.dart';
import 'package:banking_app/presentaion/screens/bank_user_screen/bank_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/create_data_base_usecase.dart';

class BankBloc extends Bloc<BankEvent, BankState> {
  final CreateBankDbUseCase createBankDbUseCase;
  final GetAllUserFromDataBaseUseCase getAllUserFromDataBaseUseCase;
  final AddUserToBankDbUseCase addUserToDataBaseUseCase;
  final UpdateDataBaseUseCase updateDataBaseUseCase;
  int currentIndex=0;
  // List<Widget> screens =[
  //   BankUserScreen(),
  //   const UserTransferDataScreen(),
  // ];
  BankBloc(this.createBankDbUseCase, this.getAllUserFromDataBaseUseCase,
      this.addUserToDataBaseUseCase, this.updateDataBaseUseCase)
      : super(const BankState()) {
    on<CreateDatabaseEvent>((event, emit) async {
      final result = await createBankDbUseCase.execute();
      emit(const BankState(createDbState: RequestState.loaded));
      result.fold(
          (l) => emit(BankState(
              createDbState: RequestState.error, createDbMessage: l.message)),
          (r) => emit(BankState(
                createDbState: RequestState.loaded,
                createDb: r,
              )));
    });
    on<GetalluserFromDatabaseEvent>((event, emit) async {
      final result = await getAllUserFromDataBaseUseCase.execute();
      emit(const BankState(getAllUserState: RequestState.loaded));
      result.fold(
          (l) => emit(BankState(
              getAllUserState: RequestState.error, createDbMessage: l.message)),
          (r) => emit(BankState(
                getAllUserState: RequestState.loaded,
                allUser: r,
              )));
    });

    on<AddUserToDatabaseEvent>((event, emit) async {
      final result = await addUserToDataBaseUseCase.execute(event.name,
          event.email, event.transferFrom, event.transferTo, event.total);
      emit(const BankState(addUserState: RequestState.loaded));
      result.fold(
          (l) => emit(BankState(
              addUserState: RequestState.error, createDbMessage: l.message)),
          (r) => emit(BankState(
                addUserState: RequestState.loaded,
                addUser: r,
              )));
    });
    on<ChangeBottomNavBarEvent>((event, emit) {
      switch(event.currentIndex){
        case 0:
        return  emit(const BankState(changeBottomState: RequestState.loading));
        case 1:
          return emit(const BankState(changeBottomState: RequestState.loaded));

      }
      emit(const BankState(
          changeBottomState: RequestState.loaded));
    });
    on<UpdateUserInDataBaseEvent>((event, emit) async {
      final result =
          await updateDataBaseUseCase.execute(event.status, event.id);
      result.fold(
          (l) => emit(BankState(
              updateUserState: RequestState.error,
              updateUserMessage: l.message)),
          (r) => emit(BankState(
                updateUserState: RequestState.loaded,
                updateUser: r,
              )));
    });
  }
}
