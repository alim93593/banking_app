// ignore_for_file: avoid_print

import 'package:banking_app/core/services/services_locator.dart';
import 'package:banking_app/presentaion/controller/bank_bloc.dart';
import 'package:banking_app/presentaion/controller/bank_event.dart';
import 'package:banking_app/presentaion/controller/bank_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context){
      return BankBloc(sl(), sl(), sl(), sl(),);
    },
    child: BlocBuilder<BankBloc,BankState>(
      builder: (context,state){
        return  Padding(
          padding: const EdgeInsets.only(left: 6.0, right: 6.0, bottom: 2.0),
          child: BottomNavigationBar(
            mouseCursor: MouseCursor.defer,
            iconSize: 40.0,
            elevation: 1.0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black.withOpacity(0.12),
            selectedLabelStyle:
            const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
            selectedItemColor: Colors.yellow.withOpacity(1.0),
            unselectedItemColor: Colors.yellow.withOpacity(1.0),
            unselectedLabelStyle:
            const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
            unselectedFontSize: 22.0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_add_alt,
                  color: Colors.white,
                  size: 50.0,
                ),
                label: 'Add User',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 50.0,
                ),
                label: 'All User',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.attach_money_rounded,
                  color: Colors.white,
                  size: 50.0,
                ),
                label: 'Transfer',
              ),
            ],
            currentIndex:state.currentIndex,
            selectedFontSize: 11,
            onTap: (index){
              state.currentIndex!=index;
              BankBloc(sl(), sl(), sl(), sl(),).add(ChangeBottomNavBarEvent(currentIndex: index));
              // print( state.currentIndex);
            },
          ),
        );
      },
    ),
    );
  }
}
