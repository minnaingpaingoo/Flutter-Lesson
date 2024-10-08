import 'package:flutter/material.dart';
import 'package:world_time1/pages/home.dart';
import 'package:world_time1/pages/loading.dart';
import 'package:world_time1/pages/choose_location.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes:{
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation(),
    },
  ));
}
