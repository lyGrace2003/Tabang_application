import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabang_application/app_style.dart';
import 'package:tabang_application/login/login.dart';
import 'package:tabang_application/size_config.dart';

//need to check if this works

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
  final _confirmPasswordController = TextEditingController();
  final String role = "Client";

  bool isVisible = false;
  bool isObscure = true;
  bool isObscure2 = true;

  EmailOTP otp = EmailOTP();

 Future register()async{
 if(_formkey.currentState!.validate()){
   if (confirmPass()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(), 
        password: _passwordController.text.trim()
        ).then((value) => {postDetailsToFirestore(context)})
          .catchError((e) {});
    }
  }
}


bool confirmPass(){
  if(_passwordController.text.trim()== _confirmPasswordController.text.trim()){
    return true;
  }else{
    return false;
  }
}

postDetailsToFirestore(BuildContext context) async {
    var user = FirebaseAuth.instance.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({
      'firstName':_firstNameController.text.trim(),
      'lastName':_lastNameController.text.trim(),
      'contactNum':_contactNumController.text.trim(),
      'email':_emailController.text.trim(),
      'role': role
      });
    sendto(context);
  }

  void sendto(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login()),
  );
}

@override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _contactNumController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
              end: Alignment.bottomRight,),),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const SizedBox(height: 20,),
              Row(children: [
              IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: SvgPicture.asset("assets/white_left_arrow.svg")),
            ],),
            Container(
              
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25,),
                  Text("Welcome",style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*10,),),
                  Text("Sign up to register as a user",style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4,),),
                  const SizedBox(height: 35,),
                  Form(
                    key: _formkey,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("First Name", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4.5),),
                        SizedBox(
                          width: SizeConfig.screenWidth!*0.8,
                          child: TextField(
                            controller: _firstNameController,
                            style: const TextStyle(color: mWhite),
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(      
                                borderSide: BorderSide(color:mWhite),   
                                ), 
                            ),
                          ),
                        ),
                        const SizedBox(height: 35,),
                        Text("Last Name:", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4.5),),
                        SizedBox(
                          width: SizeConfig.screenWidth!*0.8,
                          child: TextField(
                            controller: _lastNameController,
                            style: const TextStyle(color: mWhite),
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(      
                                borderSide: BorderSide(color:mWhite),   
                                ), 
                            ),
                          ),
                        ),
                        const SizedBox(height: 35,),
                        Text("Contact Number", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4.5),),
                        SizedBox(
                          width: SizeConfig.screenWidth!*0.8,
                          child: TextField(
                            style: const TextStyle(color: mWhite),
                            controller: _contactNumController,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(      
                                borderSide: BorderSide(color:mWhite),   
                                ), 
                            ),
                          ),
                        ),
                        const SizedBox(height: 35,),
                        Text("Email Address", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4.5),),
                        SizedBox(
                          width: SizeConfig.screenWidth!*0.8,
                          child: TextField(
                            style: const TextStyle(color: mWhite),
                            controller: _emailController,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(      
                                borderSide: BorderSide(color:mWhite),   
                                ), 
                            ),
                          ),
                        ),
                        const SizedBox(height: 35,),
                        Text("Password", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4.5),),
                        SizedBox(
                          width: SizeConfig.screenWidth!*0.8,
                          child: TextField(
                            style: const TextStyle(color: mWhite),
                            controller: _passwordController,
                            obscureText: isObscure,
                            decoration:  InputDecoration(
                              enabledBorder: const UnderlineInputBorder(      
                                borderSide: BorderSide(color:mWhite),   
                                ), 
                                suffixIcon: IconButton(
                                icon: isObscure
                                    ? SvgPicture.asset("assets/white_not_visible.svg")
                                    : SvgPicture.asset("assets/white_is_visible.svg"),
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                }),
                            ),
                          ),
                        ),
                        const SizedBox(height: 35,),
                        Text("Confirm Password", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4.5),),
                        SizedBox(
                          width: SizeConfig.screenWidth!*0.8,
                          child: TextField(
                            style: const TextStyle(color: mWhite),
                            obscureText: isObscure2,
                            controller: _confirmPasswordController,
                            decoration:  InputDecoration(
                              enabledBorder: const UnderlineInputBorder(      
                                borderSide: BorderSide(color:mWhite),   
                                ), 
                                suffixIcon: IconButton(
                                icon: isObscure2
                                    ? SvgPicture.asset("assets/white_not_visible.svg")
                                    : SvgPicture.asset("assets/white_is_visible.svg"),
                                onPressed: () {
                                  setState(() {
                                    isObscure2 = !isObscure2;
                                  });
                                }),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                        ElevatedButton(
                        style: buttonWhite,
                        onPressed: ()async {
                          // otp.setConfig(
                          //   appEmail: "Allyssagrace2003@gmail.com",
                          //   appName: "TABANG",
                          //   userEmail: _emailController.text.trim(),
                          //   otpLength: 4,
                          //   otpType: OTPType.digitsOnly
                          // );
                          //  if (await otp.sendOTP() == true) {
                          //   AwesomeDialog(
                          //     context: context,
                          //     dialogType: DialogType.info,
                          //     title: 'OTP',
                          //     desc: 'OTP has been sent'
                          //   );
                            register();
                          //  }else{
                          //   AwesomeDialog(
                          //     context: context,
                          //     dialogType: DialogType.error,
                          //     title: 'OTP',
                          //     desc: 'OTP has not been sent'
                          //   );
                          //  }
                        }, 
                        child:Text('Sign up', style: mBold.copyWith(
                        color: mOrange, fontSize:SizeConfig.blocksHorizontal!*5),
                      ),),
                      ],
                      ),
            const SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}
  