import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabang_application/User%20Interface/screens.dart';
import 'package:tabang_application/app_style.dart';
import 'package:tabang_application/login/signup/login.dart';
import 'package:tabang_application/size_config.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

    return Scaffold(
      body: Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors:[Color.fromARGB(255, 255, 106, 0),mOrange,mBrightOrange,mYellow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children:[
          // IconButton(onPressed: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => const Login()),
          //       );
          //   }, icon: SvgPicture.asset("white_left_arrow.svg")),
          const SizedBox(height: 170,),
          Row(
            children: [
              const SizedBox(width: 55,),
              Text("TABANG",style: mExtraBold.copyWith(color: mWhite, fontSize:SizeConfig.blocksHorizontal!*14,letterSpacing:5),),],
          ),
          const SizedBox(height: 70,),
          Expanded(
              child: Container(
                width: SizeConfig.screenWidth,
                decoration: const BoxDecoration(
                  color: mWhite,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 35,),
                    _buildLoginText("Welcome Back",6),
                    const SizedBox(height: 8,),
                    _buildLoginText("Login to continue",4),
                    const SizedBox(height: 50,),
                    _buildLoginText("Email Address",4),
                    _buildinputField(emailcontroller),
                    const SizedBox(height: 30,),
                    _buildLoginText("Password",4),
                    _buildinputField(passwordcontroller),
                    const SizedBox(height: 40),
                    Row(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                      ElevatedButton(
                      style: buttonOrange,
                      onPressed: () {
                        //if  sakto ang email and pass then do this
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Screens(),
                          ),
                        );
                      }, child:Text('Login', style: mBold.copyWith(
                      color: mWhite, fontSize:SizeConfig.blocksHorizontal!*5),
                    ),),
                    ],
                    ),
                    ],),
                  ),
              ),
        ],
              ),
        ),
    );
  }
}


Widget _buildinputField(TextEditingController controller){
  return Container(
    width: SizeConfig.screenWidth!*0.9,
    padding: const EdgeInsets.only(left: 30),
    child: TextField(
    controller: controller,
  ),
  );
}

Widget _buildLoginText(String text, int size){
  return Row(children: [
    const SizedBox(width: 30,),
      Text(text,style: mRegular.copyWith(color:mBlack, fontSize: SizeConfig.blocksHorizontal!*size),),
  ],);
}