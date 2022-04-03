import 'package:flutter/material.dart';
import 'package:recycle_project/Constants/colors.dart';

AppBar customAppBar(){
  return AppBar(
    title: const Text('Django Agendamentos'),
    backgroundColor: appGreen, //Colors.lightGreen.shade400,
  );
}