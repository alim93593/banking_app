// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:banking_app/presentaion/controller/bank_bloc.dart';
import 'package:banking_app/presentaion/controller/bank_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utils/custom_bottom_nav_bar.dart';

class BankHomeScreen extends StatelessWidget {
  const BankHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return sl<BankBloc>()
          ..add(GetalluserFromDatabaseEvent())
          ..add(CreateDatabaseEvent())
          ..add(GetalluserFromDatabaseEvent());
      },
      child: Scaffold(
        // appBar: CustomAppBar(),
          body: CustomBottomNavBar(),
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Center(
      //       child: Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: SizedBox(
      //           width: double.infinity,
      //           child: MyButton(
      //               label: 'Add User',
      //               onTap: () {
      //                 navigateto(context,  BankUserScreen());
      //               }),
      //         ),
      //       ),
      //     ),
      //     Center(
      //       child: Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: SizedBox(
      //           width: double.infinity,
      //           child: MyButton(
      //               label: 'Show All User',
      //               onTap: () {
      //                 navigateto(context, const UserTransferDataScreen());
      //               }),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal,
      elevation: 0,
      title: Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            'Banking App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
