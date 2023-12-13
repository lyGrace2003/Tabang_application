import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabang_application/User%20Interface/screens.dart';
import 'package:tabang_application/utils/app_style.dart';
import 'package:tabang_application/login/login.dart';
import 'package:tabang_application/login/verify_email.dart';
import 'package:tabang_application/provider%20interface/screens_provider.dart';
import 'package:tabang_application/utils/size_config.dart';

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
            else if(snapshot.data?['role'] == 'Service Provider'){
              if(snapshot.data?['verified'] == '0'){
                return const CheckEligibility();
              }else if(snapshot.data?['verified']=='1'){
                return const ScreensProvider();
              }
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
          if(!snapshot.hasData){
            return const VerifyEmail();
          }if(snapshot.hasData){
            return const VerifyEmail();
          }
          return const CircularProgressIndicator();
        },
        ),
    );
  }
}

class CheckEligibility extends StatelessWidget { 
  const CheckEligibility({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
        padding: const EdgeInsets.all(20),
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors:[Color.fromARGB(255, 255, 106, 0),mOrange,mBrightOrange,mYellow],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,),),
        child: Column(
          children:[
            Row(children:[
              IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                }, icon: SvgPicture.asset("assets/white_left_arrow.svg")),
              ],
            ),
          SizedBox(height: SizeConfig.screenHeight!*0.3,),
          Text("Registration in process", style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*10)),
          Text("We will notify you once verification is complete ", style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*5)),
          ],
        ),
      ),
  );
  }
}


