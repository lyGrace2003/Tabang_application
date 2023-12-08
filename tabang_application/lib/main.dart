import 'package:flutter/material.dart';
import 'package:tabang_application/login/login.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key?key}):super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: 'TABANG',
      debugShowCheckedModeBanner: false,
        home: Login(),
    );
  }
}