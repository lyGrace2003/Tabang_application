import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabang_application/app_style.dart';
import 'package:tabang_application/size_config.dart';

class RegisterClient extends StatefulWidget {
  const RegisterClient({super.key});

  @override
  State<RegisterClient> createState() => _RegisterClientState();
}

class _RegisterClientState extends State<RegisterClient> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _contactNumController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  

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
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome",style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*10,),),
                Text("Sign up to register as a user",style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4,),),
                Form(
                  key: _formkey,
                  child:Column(
                    children: [
                      Text("First Name", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4),),
                      Text("First Name", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4),),
                      Text("First Name", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4),),
                      Text("First Name", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4),),
                      Text("First Name", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4),),
                    ],
                  ))
              ],
            ),
          )
          ],
        ),
      ),
    );
  }
}
  