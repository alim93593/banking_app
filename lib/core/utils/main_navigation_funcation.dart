import 'package:flutter/material.dart';

void navigateto(context, widget) =>  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigateandfinish(context, widget) =>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget),(route){
  return false;
});