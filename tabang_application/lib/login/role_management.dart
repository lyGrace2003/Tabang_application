import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tabang_application/User%20Interface/screens.dart';
import 'package:tabang_application/login/login.dart';
import 'package:tabang_application/login/verify_email.dart';
import 'package:tabang_application/provider%20interface/screens_provider.dart';

class RoleManagement extends StatelessWidget {
  const RoleManagement({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot?>(
        stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
        builder: (context, snapshot){
            if(snapshot.data?['role'] == 'Client'){
              return const Screens();
            }
            else if(snapshot.data?['role'] == 'Service provider'){
             return const ScreensProvider();
            }
            return Container();
          }
      ),
    );
  }
}

class SendEmailVerification extends StatefulWidget {
  const SendEmailVerification({super.key});

  @override
  State<SendEmailVerification> createState() => _SendEmailVerificationState();
}

class _SendEmailVerificationState extends State<SendEmailVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const VerifyEmail();
          }else{
            return const Login();
          }
        },
        ),
    );
  }
}

