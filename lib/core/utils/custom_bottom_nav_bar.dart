// ignore_for_file: avoid_print, must_be_immutable
import 'package:banking_app/presentaion/controller/bank_event.dart';
import 'package:banking_app/presentaion/controller/bank_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentaion/controller/bank_bloc.dart';
import '../services/services_locator.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<BankBloc,BankState>(
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.teal,
            title: const Text(
              'Hello to BankingApp',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body:sl<BankBloc>().screens[state.currentIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left: 6.0, right: 6.0, bottom: 2.0),
            child: BottomNavigationBar(
              mouseCursor: MouseCursor.defer,
              iconSize: 40.0,
              elevation: 1.0,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle:
              const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
              selectedItemColor: Colors.teal.withOpacity(1.0),
              unselectedItemColor: Colors.teal.withOpacity(1.0),
              unselectedLabelStyle:
              const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
              unselectedFontSize: 22.0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_add_alt,
                    color: Colors.black,
                    size: 40.0,
                  ),
                  label: 'Add User',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 40.0,
                  ),
                  label: 'All User',
                ),
              ],
              currentIndex: sl<BankBloc>().currentIndex,
              selectedFontSize: 11,
              onTap: (index) {
                BlocProvider.of<BankBloc>(context)
                    .add(ChangeBottomNavBarEvent(currentIndex: index));
                // if (index == 0) {
                //    BlocProvider.of<BankBloc>(context)
                //     .add(ChangeBottomNavBarEvent(currentIndex: index));
                // }
                // if (index == 1) {
                //   BlocProvider.of<BankBloc>(context)
                //      .add(ChangeBottomNavBarEvent(currentIndex: index));
                // }
              },
            ),
          ),
        );
      },
    );
  }
}
