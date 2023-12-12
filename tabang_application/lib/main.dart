import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tabang_application/User%20Interface/screens.dart';
import 'package:tabang_application/login/login.dart';
import 'package:tabang_application/provider%20interface/screens_provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
        home: Login()
        // Login(),
    );
  }
}