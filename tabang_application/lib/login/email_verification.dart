// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:tabang_application/app_style.dart';
// import 'package:tabang_application/login/login.dart';
// import 'package:email_otp/email_otp.dart';
// import 'package:tabang_application/size_config.dart';

// //need to check if this works


// class Otp extends StatelessWidget {
//   final TextEditingController otpController;
//   const Otp({Key? key,required this.otpController,}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 50,
//       height: 50,
//       child: TextFormField(
//         controller: otpController,
//         keyboardType: TextInputType.number,
//         style: Theme.of(context).textTheme.headline6,
//         textAlign: TextAlign.center,
//         inputFormatters: [
//           LengthLimitingTextInputFormatter(1),
//           FilteringTextInputFormatter.digitsOnly
//         ],
//         onChanged: (value) {
//           if (value.length == 1) {
//             FocusScope.of(context).nextFocus();
//           }
//           if (value.isEmpty) {
//             FocusScope.of(context).previousFocus();
//           }
//         },
//         decoration: const InputDecoration(
//           hintText: ('0'),
//         ),
//         onSaved: (value) {},
//       ),
//     );
//   }
// }


// class EmailVerification extends StatelessWidget {

//   String firstName, lastName, contactNum, email, password, confrimpassword, role;
//   final GlobalKey<FormState> formkey;

//    EmailVerification({
//     required this.firstName,
//     required this.lastName,
//     required this.contactNum,
//     required this.email,
//     required this.password,
//     required this.confrimpassword,
//     required this.role,
//     required this.formkey
//     });

//     final _otp1Controller = TextEditingController();
//     final _otp2Controller = TextEditingController();
//     final _otp3Controller = TextEditingController();
//     final _otp4Controller = TextEditingController();
//     String otpController = "1234";

//     EmailOTP otp = EmailOTP();

//     Future register(BuildContext context)async{
//  if(formkey.currentState!.validate()){
//    if (confirmPass()) {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email, 
//         password: password
//         ).then((value) => {postDetailsToFirestore(context)})
//           .catchError((e) {});
//     }
//   }
// }


// bool confirmPass(){
//   if(password== confrimpassword){
//     return true;
//   }else{
//     return false;
//   }
// }

// postDetailsToFirestore(BuildContext context) async {
//     var user = FirebaseAuth.instance.currentUser;
//     CollectionReference ref = FirebaseFirestore.instance.collection('users');
//     ref.doc(user!.uid).set({
//       'firstName':firstName,
//       'lastName':lastName,
//       'contactNum':contactNum,
//       'email':email,
//       'role': role
//       });
//     toConstruct(context);
//   }

//   void toConstruct(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => Login()),
//   );
// }


//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);

//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(20),
//         width: SizeConfig.screenWidth,
//         height: SizeConfig.screenHeight,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors:[Color.fromARGB(255, 255, 106, 0),mOrange,mBrightOrange,mYellow],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,),),
//         child: Column(
//         children: [
//           const SizedBox(
//             height: 40,
//           ),
//           const Icon(Icons.dialpad_rounded, size: 50),
//           const SizedBox(
//             height: 40,
//           ),
//           Text(
//             "Enter OTP",
//             style:mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*5),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Otp(
//                 otpController: _otp1Controller,
//               ),
//               Otp(
//                 otpController: _otp2Controller,
//               ),
//               Otp(
//                 otpController: _otp3Controller,
//               ),
//               Otp(
//                 otpController: _otp4Controller,
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           ElevatedButton(
//             onPressed: () async {
//             if (await otp.verifyOTP(otp: _otp1Controller.text +
//                     _otp2Controller.text +
//                     _otp3Controller.text +
//                     _otp4Controller.text) == true) {
//                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                   content: Text("OTP is verified"),
//                 ));
//                 register(context);
//               } else {
//                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                   content: Text("Invalid OTP"),
//                 ));
//               }
//             },
//             child: const Text(
//               "Confirm",
//               style: TextStyle(fontSize: 20),
//             ),
//           )
//         ],
//       ),
//       ),
//     );
//   }
// }

