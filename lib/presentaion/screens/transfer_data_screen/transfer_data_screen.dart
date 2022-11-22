// ignore_for_file: must_be_immutable, avoid_print

import 'package:banking_app/core/services/services_locator.dart';
import 'package:banking_app/core/utils/constant.dart';
import 'package:banking_app/core/utils/main_navigation_funcation.dart';
import 'package:banking_app/presentaion/controller/bank_bloc.dart';
import 'package:banking_app/presentaion/controller/bank_event.dart';
import 'package:banking_app/presentaion/controller/bank_state.dart';
import 'package:banking_app/presentaion/screens/bank_user_data/user_transfer_data_screen.dart';
import 'package:banking_app/presentaion/widget/button.dart';
import 'package:banking_app/presentaion/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateUserTransferDataScreen extends StatefulWidget {
  UpdateUserTransferDataScreen({
    Key? key,
    required this.id,
    required this.total,
    required this.name,
    required this.email,
  }) : super(key: key);
  int id;
  int total;
  String name;
  String email;

  @override
  State<UpdateUserTransferDataScreen> createState() => _UpdateUserTransferDataScreenState();
}

class _UpdateUserTransferDataScreenState extends State<UpdateUserTransferDataScreen> {
  var userNameController = TextEditingController();

  var emailController = TextEditingController();

  var balanceController = TextEditingController();

  var amountController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var bloc = BankBloc(sl(), sl(), sl(), sl(),);

  String selectedName="";
  int amount=0;

  int userId=0;

  int transferAmountToUser =0;

  @override
  Widget build(BuildContext context) {

    return  BlocBuilder<BankBloc, BankState>(
        builder: (context, state) {
          userNameController.text = widget.name;
          emailController.text = widget.email;
          balanceController.text = widget.total.toString();
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'TransFer Data',
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
                        label: 'Transfer',
                        hint:selectedName.isNotEmpty? selectedName:"TransFer To",
                        widget: DropdownButton(
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          ),
                          iconSize: 32,
                          elevation: 4,
                          style: subtitleStyle(context),
                          underline: Container(
                            height: 0,
                          ),
                          onChanged: (newvalue) {
                            setState(() {
                             selectedName = newvalue.toString();
                            });
                          },
                          items: state.allUser.map((value) {
                            return DropdownMenuItem<String>(
                              value: value.name.toString(),
                              child: Text(
                                value.name.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              onTap: (){
                                setState(() {
                                  userId = value.id!;
                                  transferAmountToUser = value.total;
                                  print(value.id);
                                  print(transferAmountToUser);
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyInputFeild(
                        label: "Amount",
                        hint: "Amount",
                        enabled: true,
                        controller: amountController,
                        type: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyInputFeild(
                        label: "Balance",
                        hint: "Balance",
                        readOnly: true,
                        enabled: false,
                        controller: balanceController,
                        type: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: MyButton(
                          label: 'TransFer Data',
                          onTap: () {
                            if (userNameController.text.isNotEmpty &&
                                emailController.text.isNotEmpty &&
                                balanceController.text.isNotEmpty&&
                                amountController.text.isNotEmpty&&
                             selectedName.isNotEmpty){
                                amount = int.parse(amountController.text.toString());
                               if(amount>widget.total){
                                 return ScaffoldMessenger.of(context)
                                     .showSnackBar(const SnackBar(
                                   content: Text("Please Enter Valid Amount"),
                                 ));
                               }else{
                                 var totalAmount = widget.total-amount;
                                     print(totalAmount);
                                     bloc.add(UpdateUserInDataBaseEvent(
                                      status: totalAmount,
                                      id: widget.id
                                   ));
                                     var finalTotalAmount = transferAmountToUser +amount;
                                     bloc.add(UpdateUserInDataBaseEvent(
                                      status: finalTotalAmount,
                                      id: userId
                                 ));
                                     print(finalTotalAmount);
                                     bloc.add(GetalluserFromDatabaseEvent());
                                     ScaffoldMessenger.of(context)
                                     .showSnackBar(const SnackBar(
                                   content: Text("Data Have Been Transfer Successfully"),
                                 ));
                                     navigateandfinish(context, const UserTransferDataScreen());
                               }
                            } else {
                              return ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Please Enter Valid Data"),
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
    );
  }
}
