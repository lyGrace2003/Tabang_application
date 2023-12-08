import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tabang_application/User%20Interface/screens.dart';
import 'package:tabang_application/login/login_page.dart';

class RoleManagement extends StatelessWidget {
  const RoleManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Screens();
          }else{
            return LoginPage();
          }
        },
      ),
    );
  }
}
