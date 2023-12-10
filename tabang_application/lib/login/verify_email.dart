import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:tabang_application/app_style.dart';
import 'package:tabang_application/login/role_management.dart';
import 'package:tabang_application/size_config.dart';

//confrimation email cant be sent

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  Timer? timer;
  String userEmail ='';

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if(!isEmailVerified){
      sendVerificationEmail();
    }

    Timer.periodic(
      const Duration(seconds: 3),
      (_) => checkEmailVerifired(),
      );
  }

  Future sendVerificationEmail() async{
    try{
      final user = FirebaseAuth.instance.currentUser!;
        await user.sendEmailVerification();

    }catch(e){
      print(e);
    }
  }

  Future checkEmailVerifired() async{
    await FirebaseAuth. instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if(isEmailVerified){
      timer?.cancel();
      sendConfirmationEmail();
    }
  }

  getuseremail() {
    final user = FirebaseAuth.instance.currentUser;
    if(user != null){
    setState(() => userEmail = user.email!);
}
 }


 Future<void> sendConfirmationEmail() async{
  try{
    getuseremail();
    var message = Message();
    message.subject = 'Confirmation Email';
    message.html = '<h4>You have succesfuly been registered!</h4>';
    message.from = const Address('tabang.app.cop@gmail.com');
    message.recipients.add(userEmail);
    var smtpServer = gmailSaslXoauth2('tabang.app.cop@gmail.com', 'huwx sekr dwoe jwyl');
    send(message, smtpServer);
  }catch(e){
    print(e);
  }
 }

  @override
  Widget build(BuildContext context)=>isEmailVerified
    ? const RoleManagement()
    : Scaffold(
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
                  Navigator.pop(context);
                }, icon: SvgPicture.asset("assets/white_left_arrow.svg")),
              ],
            ),
          SizedBox(height: SizeConfig.screenHeight!*0.3,),
          Text("Verify Email", style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*10)),
          Text("to succesfully create your account please press the link sent to your email", style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*5)),
          SizedBox( height: SizeConfig.screenHeight!*0.1,),
          OutlinedButton(
            style: buttonOutlinedWhite,
            onPressed: sendVerificationEmail,
             child: Text("Resend Email", style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4))),
          ],
        ),
      ),
    );
  }