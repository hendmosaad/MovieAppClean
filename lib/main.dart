import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movies_app/core/ServicesLocator.dart';
import 'package:movies_app/movies/persentation/screens/movies_screen.dart';

void main() {

   ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900
      ),
      home:  MainMoviesScreen(),
    );
  }
}


