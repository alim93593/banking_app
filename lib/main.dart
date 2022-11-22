// ignore_for_file: avoid_print

import 'package:banking_app/core/services/services_locator.dart';
import 'package:banking_app/presentaion/controller/bank_bloc.dart';
import 'package:banking_app/presentaion/screens/bank_home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:  [
        BlocProvider(create:(BuildContext context)=>sl<BankBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home:  const BankHomeScreen(),
      ),
    );
  }
}
