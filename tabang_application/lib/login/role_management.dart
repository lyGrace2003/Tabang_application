import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tabang_application/User%20Interface/screens.dart';
import 'package:tabang_application/login/login.dart';
import 'package:tabang_application/provider%20interface/screens_provider.dart';

class RoleManagement extends StatelessWidget {
  const RoleManagement({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot?>(
        stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            if(snapshot.data!['role'] == 'Client'){
              return const Screens();
            }
            else if(snapshot.data!['role']== 'Service provider'){
             return const ScreensProvider();
            }
          }
          else{
            return const Login();
          }
          return const Divider();
        },
      ),
    );
  }
}
