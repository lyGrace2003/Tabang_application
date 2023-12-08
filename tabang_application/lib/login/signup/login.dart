import 'package:flutter/material.dart';
import 'package:tabang_application/app_style.dart';
import 'package:tabang_application/login/signup/login_page.dart';
import 'package:tabang_application/login/signup/signup_page.dart';
import 'package:tabang_application/size_config.dart';
class Login extends StatelessWidget {
  const Login({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors:[Color.fromARGB(255, 255, 106, 0),mOrange,mBrightOrange,mYellow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("TABANG", style: mExtraBold.copyWith(color: mWhite, fontSize:SizeConfig.blocksHorizontal!*14, letterSpacing: 5),),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: buttonWhite,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            }, child:Text('Login', style: mBold.copyWith(
            color: mBrightOrange, fontSize:SizeConfig.blocksHorizontal!*5),
          )),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
            style: buttonOutlinedWhite,
            onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SignupPage(),
                ),
              );
          }, child:Text('Sign up', style: mBold.copyWith(
            color: mWhite, fontSize:SizeConfig.blocksHorizontal!*5),
          ))
        ]
        ),
    ),
    );
  }
}