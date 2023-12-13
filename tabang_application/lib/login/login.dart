import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tabang_application/utils/app_style.dart';
import 'package:tabang_application/login/signup/signup_page.dart';
import 'package:tabang_application/utils/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabang_application/login/role_management.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignupPage()),
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

class LoginPage extends StatefulWidget {
   const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isVisible = false;
  bool isObscure = true;
  List<String> array=[];

    Future login() async{
      if (_formkey.currentState!.validate()) {
      try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  const SendEmailVerification()));
      }
      on FirebaseAuthException catch (e){
      if (e.code == 'user-not-found') {
          showErrorAlert("User not found", "Re-enter  your email/password");

        } else if (e.code == 'wrong-password') {
          showErrorAlert("Incorrect Password", "Re-enter your password");
      }
    }
    }
    }

showErrorAlert(String title, String text){
    return QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: title,
      text: text,
    );
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
        scrollDirection: Axis.vertical,
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
            SizedBox(height: SizeConfig.blocksVertical!*3,),
            Row(children:[
              IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: SvgPicture.asset("assets/white_left_arrow.svg")),
              ],
            ),
            SizedBox(height: SizeConfig.blocksVertical!*15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("TABANG",style: mExtraBold.copyWith(color: mWhite, fontSize:SizeConfig.blocksHorizontal!*14,letterSpacing:5),),],
            ),
            SizedBox(height: SizeConfig.blocksVertical!*10,),
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
                      SizedBox(height: SizeConfig.blocksVertical!*0.5,),
                      Text("Welcome Back", style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*6),),
                      SizedBox(height: SizeConfig.blocksVertical!*1,),
                      Text("Login to continue", style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*3.5),),
                      SizedBox(height: SizeConfig.blocksVertical!*4,),
                      Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: SizeConfig.screenWidth!*0.8,
                              child:  TextField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  hintText: "Email Address"
                                ),
                              ),
                            ),
                      SizedBox(height: SizeConfig.blocksVertical!*4,),
                            SizedBox(
                              width: SizeConfig.screenWidth!*0.8,
                              child:  TextField(
                                controller: _passwordController,
                                obscureText: isObscure,
                                decoration:  InputDecoration(
                                  hintText: "Password",
                                  suffixIcon: IconButton(
                                    icon: isObscure
                                        ? SvgPicture.asset("assets/black_not_visible.svg")
                                        : SvgPicture.asset("assets/black_is_visible.svg"),
                                    onPressed: () {
                                      setState(() {
                                        isObscure = !isObscure;
                                      });
                                    }),
                                ),
                              ),
                            ),
                          ]),
                      ),
                      
      
                      SizedBox(height: SizeConfig.blocksVertical!*4,),
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
                      SizedBox(height: SizeConfig.blocksVertical!*1,),
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
