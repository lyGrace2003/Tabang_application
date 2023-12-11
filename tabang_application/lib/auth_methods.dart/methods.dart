// import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AuthMethods{
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // sign up clients
//   Future<String> signUpClient({
//     required String firstName,
//     required String lastName,
//     required String contactNum,
//     required String email,
//     required String password,
//     // required Uint8List file, 
//   })async{
//     String res = "Some error occured";
//     try{
//       if(firstName.isNotEmpty || lastName.isNotEmpty||contactNum.isNotEmpty ||email.isNotEmpty || password.isNotEmpty ){
//        await _auth.createUserWithEmailAndPassword(email: email, password: password);

//        await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
//         'firstName':firstName,
//         'lastName': lastName,
//         'contactNum': contactNum,
//         'email': email,
//         'role': 'Client',
//         // 'file': file,
//        });
//       }
//     }catch(e){
//       res = e.toString();
//     }
//     return res;
//   }

// }