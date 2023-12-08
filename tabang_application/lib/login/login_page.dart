import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tabang_application/app_style.dart';
import 'package:tabang_application/login/login.dart';
import 'package:tabang_application/role_management.dart';
import 'package:tabang_application/size_config.dart';
import 'package:flutter_svg/svg.dart';


class LoginPage extends StatefulWidget {
   const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    Future login() async{
      if (_formkey.currentState!.validate()) {
      try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
          Navigator.push(context, MaterialPageRoute(builder: (context) => const RoleManagement()));
      }
      on FirebaseAuthException catch (e){
      if (e.code == 'user-not-found') {
          print('No user found for that email.');
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
      }
    }
    }
    }

    @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
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
            const SizedBox(height: 20,),
            Row(children:[
              IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: SvgPicture.asset("assets/white_left_arrow.svg")),
              ],
            ),
            const SizedBox(height: 120,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("TABANG",style: mExtraBold.copyWith(color: mWhite, fontSize:SizeConfig.blocksHorizontal!*14,letterSpacing:5),),],
            ),
            const SizedBox(height: 100,),
            Expanded(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  width: SizeConfig.screenWidth,
                  decoration: const BoxDecoration(
                    color: mWhite,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15,),
                      Text("Welcome Back", style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*6),),
                      const SizedBox(height: 6,),
                      Text("Login to continue", style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*3.5),),
                      const SizedBox(height: 30,),
                      Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: SizeConfig.screenWidth!*0.8,
                              child:  TextField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  hintText: "Email Address"
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Container(
                              width: SizeConfig.screenWidth!*0.8,
                              child:  TextField(
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                  hintText: "Password"
                                ),
                              ),
                            ),
                          ]),
                      ),
                      
      
                      const SizedBox(height: 50),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                        ElevatedButton(
                        style: buttonOrange,
                        onPressed: login, child:Text('Login', style: mBold.copyWith(
                        color: mWhite, fontSize:SizeConfig.blocksHorizontal!*5),
                      ),),
                      ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Forgot passoword?",style: mRegular.copyWith(color: mGrey, fontSize: SizeConfig.blocksHorizontal!*3.5),),
                        ],
                      )
                      ],),
                    ),
                ),
          ],
                ),
          ),
      ),
    );
  }
}
