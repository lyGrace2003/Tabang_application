import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabang_application/app_style.dart';
import 'package:tabang_application/size_config.dart';

class RegisterClient extends StatelessWidget {
  const RegisterClient({super.key});

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
            end: Alignment.bottomRight,),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Row(children: [
            IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: SvgPicture.asset("assets/white_left_arrow.svg")),
          ],),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome",style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*10,),),
                Text("Sign up to register as a user",style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4,),),

              ],
            ),
          )
          ],
        ),
      ),
    );
  }
}