// Author: Aurelio Hevi Alfons
// Project: Aurelio Portfolio (Flutter)
// Project Started on 23/03/2025
// Project Finished on __/__/____

import 'package:flutter/material.dart';
import 'Pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
