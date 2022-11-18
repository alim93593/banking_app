import 'package:banking_app/core/utils/main_navigation_funcation.dart';
import 'package:banking_app/presentaion/screens/bank_user_data/user_transfer_data_screen.dart';
import 'package:banking_app/presentaion/screens/bank_user_screen/bank_user_screen.dart';
import 'package:banking_app/presentaion/widget/button.dart';
import 'package:flutter/material.dart';

class BankHomeScreen extends StatelessWidget {
  const BankHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Hello to BankingApp',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: MyButton(
                    label: 'Add User',
                    onTap: () {
                      navigateto(context,  BankUserScreen());
                    }),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: MyButton(
                    label: 'Show All User',
                    onTap: () {
                      navigateto(context, const UserTransferDataScreen());
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
