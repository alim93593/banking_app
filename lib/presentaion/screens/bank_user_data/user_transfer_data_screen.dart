// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_print

import 'package:banking_app/core/utils/main_navigation_funcation.dart';
import 'package:banking_app/presentaion/controller/bank_bloc.dart';
import 'package:banking_app/presentaion/controller/bank_state.dart';
import 'package:banking_app/presentaion/screens/transfer_data_screen/transfer_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserTransferDataScreen extends StatelessWidget {
   const UserTransferDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankBloc, BankState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.allUser.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final movie = state.allUser[index];
                  print(movie);
                  return InkWell(
                    onTap: () {
                      navigateto(
                          context,
                          UpdateUserTransferDataScreen(
                            total: state.allUser[index].total,
                            name: state.allUser[index].name,
                            email: state.allUser[index].email,
                            id: state.allUser[index].id!.toInt() ,
                          ));
                          print(state.allUser[index].id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.name.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.teal,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            movie.email.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            movie.total.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Center(
                    child: SizedBox(
                      height: 1,
                      width: double.infinity,
                      child: Container(
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
    );
  }
}
