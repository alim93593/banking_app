// ignore_for_file: avoid_print, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:banking_app/core/services/services_locator.dart';
import 'package:banking_app/presentaion/controller/bank_bloc.dart';
import 'package:banking_app/presentaion/controller/bank_event.dart';
import 'package:banking_app/presentaion/controller/bank_state.dart';
import 'package:banking_app/presentaion/widget/button.dart';
import 'package:banking_app/presentaion/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BankUserScreen extends StatelessWidget {
  BankUserScreen({Key? key}) : super(key: key);
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var balanceController = TextEditingController();
  var formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var bloc = BankBloc(sl(), sl(), sl(), sl(),);
    return BlocProvider(
      create: (BuildContext context) {
        return BankBloc(sl(), sl(), sl(), sl(),)
          ..add(CreateDatabaseEvent())
          ..add(GetalluserFromDatabaseEvent());
      },
      child: BlocBuilder<BankBloc, BankState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Add User',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Please Sign Up To our Application ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      MyInputFeild(
                        label: "User Name",
                        hint: "Please Enter Your Name",
                        controller: userNameController,
                        type: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyInputFeild(
                        label: "Email",
                        hint: "Please Enter Your Email",
                        controller: emailController,
                        type: TextInputType.visiblePassword,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyInputFeild(
                        label: "Balance",
                        hint: "Balance",
                        controller: balanceController,
                        type: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: MyButton(
                          label: 'Register',
                          onTap: () {
                            if(userNameController.text.isNotEmpty && emailController.text.isNotEmpty&&balanceController.text.isNotEmpty) {
                              bloc.add(AddUserToDatabaseEvent(
                                  name: userNameController.text,
                                  email: emailController.text,
                                  transferFrom: '',
                                  transferTo: '',
                                  total:int.parse(balanceController.text)));
                                // navigateto(
                                //   context, const UserTransferDataScreen());
                              userNameController.clear();
                              emailController.clear();
                              balanceController.clear();
                            }else{
                              return   ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        "Please Enter Valid Data"
                                    ),
                                  ));
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
