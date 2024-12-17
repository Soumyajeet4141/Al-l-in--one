import 'package:flutter/material.dart';
import 'package:untitled1/page.dart';
import 'package:untitled1/pages/homedesign_page.dart';
import 'package:untitled1/profilepage.dart';
import 'package:untitled1/registrationpage.dart';
import 'package:untitled1/signup.dart';
import 'package:untitled1/stock/stock.dart';
import 'package:untitled1/ui2.dart';
import 'package:untitled1/ui3.dart';
import 'package:untitled1/ui4.dart';
import 'package:untitled1/user_create.dart';

import 'designpage.dart';
import 'monthly budget.dart';
import 'newpage.dart';
import 'newui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:  HomedesignPage(),
    );
  }
}
