import 'package:flutter/material.dart';
import 'package:matemafront/pages/login_page.dart';
import 'package:matemafront/pages/result_bad_page.dart';
import 'package:matemafront/pages/result_good_page.dart';
import 'package:matemafront/widgets/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyNavigationBar(),
      // home: LoginScreen(),
      home: const BadResultPage(),
    );
  }
}
