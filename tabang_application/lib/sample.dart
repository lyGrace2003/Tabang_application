import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabang_application/app_style.dart';
import 'package:tabang_application/size_config.dart';


//create checkbox for all task and custom - needs to add user info to task(type) collection

class RegisterProvider extends StatefulWidget {
  const RegisterProvider({super.key});

  @override
  State<RegisterProvider> createState() => _RegisterProviderState();
}

class _RegisterProviderState extends State<RegisterProvider> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _contactNumController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final  _otherController = TextEditingController();


  bool isVisible = false;
  bool isObscure = true;
  bool isObscure2 = true;
  bool? isChecked = false;

  var docId;
  final String role = 'Service Provider';
  List<String> services =[];

   void postUnverifiedProvider() async{
  CollectionReference ref = FirebaseFirestore.instance.collection('user');
    if(_formkey.currentState!.validate()){if(confirmPass()){
    ref.add({
    'firstName': _firstNameController.text.trim(),
    'lastName':  _lastNameController.text.trim(),
    'contactNum': _contactNumController.text.trim(),
    'email': _emailController.text.trim(),
    'role': role, 
    'verified': 0
  }).then((value) => docId = value.id);
  }}
}

 bool confirmPass(){
  if(_passwordController.text.trim()== _confirmPasswordController.text.trim()){
    return true;
  }else{
    return false;
  }
}


// void postTaskDetails(BuildContext context)async{
//     var user = FirebaseAuth.instance.currentUser;
//     CollectionReference ref = FirebaseFirestore.instance.collection('service');
//     for(int i =0;i< service.length;i++){
//       ref.add({
//       'service': service[i],
//       'service provider': FirebaseFirestore.doc('user/${user!.uid}'),
//       });}
// }

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          decoration: const BoxDecoration(
            color: mWhite
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const SizedBox(height: 20,),
              Row(children: [
              IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: SvgPicture.asset("assets/orange_left_arrow.svg")),
            ],),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25,),
                  Text("Welcome",style: mBold.copyWith(color: mBrightOrange, fontSize: SizeConfig.blocksHorizontal!*10,),),
                  Text("Sign up to register as a service provider",style: mRegular.copyWith(color: mOrange, fontSize: SizeConfig.blocksHorizontal!*4,),),
                  const SizedBox(height: 35,),
                  Form(
                    key: _formkey,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("First Name", style: mRegular.copyWith(color: mBrightOrange,fontSize: SizeConfig.blocksHorizontal!*4.5),),
                        SizedBox(
                          width: SizeConfig.screenWidth!*0.8,
                          child: TextField(
                            controller: _firstNameController,
                            style: const TextStyle(color: mBrightOrange),
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(      
                                borderSide: BorderSide(color:mBrightOrange),   
                                ), 
                            ),
                          ),
                        ),
                        const SizedBox(height: 35,),
                        Text("Last Name:", style: mRegular.copyWith(color: mBrightOrange,fontSize: SizeConfig.blocksHorizontal!*4.5),),
                        SizedBox(
                          width: SizeConfig.screenWidth!*0.8,
                          child: TextField(
                            controller: _lastNameController,
                            style: const TextStyle(color: mBrightOrange),
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(      
                                borderSide: BorderSide(color:mBrightOrange),   
                                ), 
                            ),
                          ),
                        ),
                        const SizedBox(height: 35,),
                        Text("Contact Number", style: mRegular.copyWith(color: mBrightOrange,fontSize: SizeConfig.blocksHorizontal!*4.5),),
                        SizedBox(
                          width: SizeConfig.screenWidth!*0.8,
                          child: TextField(
                            style: const TextStyle(color: mBrightOrange),
                            controller: _contactNumController,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(      
                                borderSide: BorderSide(color:mBrightOrange),   
                                ), 
                            ),
                          ),
                        ),
                        const SizedBox(height: 35,),
                        Text("Email Address", style: mRegular.copyWith(color: mBrightOrange,fontSize: SizeConfig.blocksHorizontal!*4.5),),
                        SizedBox(
                          width: SizeConfig.screenWidth!*0.8,
                          child: TextField(
                            style: const TextStyle(color: mBrightOrange),
                            controller: _emailController,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(      
                                borderSide: BorderSide(color:mBrightOrange),   
                                ), 
                            ),
                          ),
                        ),
                        const SizedBox(height: 35,),
                        Text("Password", style: mRegular.copyWith(color: mBrightOrange,fontSize: SizeConfig.blocksHorizontal!*4.5),),
                        SizedBox(
                          width: SizeConfig.screenWidth!*0.8,
                          child: TextField(
                            style: const TextStyle(color: mBrightOrange),
                            controller: _passwordController,
                            obscureText: isObscure,
                            decoration:  InputDecoration(
                              enabledBorder: const UnderlineInputBorder(      
                                borderSide: BorderSide(color:mBrightOrange),   
                                ), 
                                suffixIcon: IconButton(
                                icon: isObscure
                                    ? SvgPicture.asset("assets/orange_not_visible.svg")
                                    : SvgPicture.asset("assets/orange_is_visible.svg"),
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                }),
                            ),
                          ),
                        ),
                        const SizedBox(height: 35,),
                        Text("Confirm Password", style: mRegular.copyWith(color: mBrightOrange,fontSize: SizeConfig.blocksHorizontal!*4.5),),
                        SizedBox(
                          width: SizeConfig.screenWidth!*0.8,
                          child: TextField(
                            style: const TextStyle(color: mBrightOrange),
                            obscureText: isObscure2,
                            controller: _confirmPasswordController,
                            decoration:  InputDecoration(
                              enabledBorder: const UnderlineInputBorder(      
                                borderSide: BorderSide(color:mBrightOrange),   
                                ), 
                                suffixIcon: IconButton(
                                icon: isObscure2
                                    ? SvgPicture.asset("assets/orange_not_visible.svg")
                                    : SvgPicture.asset("assets/orange_is_visible.svg"),
                                onPressed: () {
                                  setState(() {
                                    isObscure2 = !isObscure2;
                                  });
                                }),
                            ),
                          ),
                        ),
                        Text("Services", style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*10),),
                    Text("Select the services you wish to provide", style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4)),
                    Row(
                      children: [
                        CheckboxListTile(
                          title: Text("House Cleaning", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4),),
                          value: isChecked, 
                          onChanged: (bool? newValue){
                            setState(() {
                              isChecked = newValue;
                            });
                            if(isChecked == true){
                              services.add("House Cleaning");
                            }else if(isChecked==false){
                              services.remove("House Cleaning");
                            }
                          },
                          activeColor: mWhite,
                          checkColor: mOrange,
                          ),
                          const SizedBox(width: 20,),
                           CheckboxListTile(
                          title: Text("Personal Shopper", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4),),
                          value: isChecked, 
                          onChanged: (bool? newValue){
                            setState(() {
                              isChecked = newValue;
                            });
                            if(isChecked == true){
                              services.add("Personal Shopper");
                            }else if(isChecked==false){
                              services.remove("Personal Shopper");
                            }
                          },
                          activeColor: mWhite,
                          checkColor: mOrange,
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        CheckboxListTile(
                          title: Text("Delievery", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4),),
                          value: isChecked, 
                          onChanged: (bool? newValue){
                            setState(() {
                              isChecked = newValue;
                            });
                            if(isChecked == true){
                              services.add("Delievery");
                            }else if(isChecked==false){
                              services.remove("Delievery");
                            }
                          },
                          activeColor: mWhite,
                          checkColor: mOrange,
                          ),
                          const SizedBox(width: 20,),
                           CheckboxListTile(
                          title: Text("Run Errands", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4),),
                          value: isChecked, 
                          onChanged: (bool? newValue){
                            setState(() {
                              isChecked = newValue;
                            });
                            if(isChecked == true){
                              services.add("Run Errands");
                            }else if(isChecked==false){
                              services.remove("Run Errands");
                            }
                          },
                          activeColor: mWhite,
                          checkColor: mOrange,
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        CheckboxListTile(
                          title: Text("Tutoring", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4),),
                          value: isChecked, 
                          onChanged: (bool? newValue){
                            setState(() {
                              isChecked = newValue;
                            });
                            if(isChecked == true){
                              services.add("Tutoring");
                            }else if(isChecked==false){
                              services.remove("Tutoring");
                            }
                          },
                          activeColor: mWhite,
                          checkColor: mOrange,
                          ),
                          const SizedBox(width: 20,),
                           CheckboxListTile(
                          title: Text("Transcription", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4),),
                          value: isChecked, 
                          onChanged: (bool? newValue){
                            setState(() {
                              isChecked = newValue;
                            });
                            if(isChecked == true){
                              services.add("Transcription");
                            }else if(isChecked==false){
                              services.remove("Transcription");
                            }
                          },
                          activeColor: mWhite,
                          checkColor: mOrange,
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        CheckboxListTile(
                          title: Text("Video Editor", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4),),
                          value: isChecked, 
                          onChanged: (bool? newValue){
                            setState(() {
                              isChecked = newValue;
                            });
                            if(isChecked == true){
                              services.add("Video Editor");
                            }else if(isChecked==false){
                              services.remove("Video Editor");
                            }
                          },
                          activeColor: mWhite,
                          checkColor: mOrange,
                          ),
                          const SizedBox(width: 20,),
                           CheckboxListTile(
                          title: Text("Photo Editor", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4),),
                          value: isChecked, 
                          onChanged: (bool? newValue){
                            setState(() {
                              isChecked = newValue;
                            });
                            if(isChecked == true){
                              services.add("Photo Editor");
                            }else if(isChecked==false){
                              services.remove("Photo Editor");
                            }
                          },
                          activeColor: mWhite,
                          checkColor: mOrange,
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        CheckboxListTile(
                          title: Text("Video Editor", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4),),
                          value: isChecked, 
                          onChanged: (bool? newValue){
                            setState(() {
                              isChecked = newValue;
                            });
                            if(isChecked == true){
                              services.add("Video Editor");
                            }else if(isChecked==false){
                              services.remove("Video Editor");
                            }
                          },
                          activeColor: mWhite,
                          checkColor: mOrange,
                          ),
                          const SizedBox(width: 20,),
                           CheckboxListTile(
                          title: Text("Others", style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*4),),
                          value: isChecked, 
                          onChanged: (bool? newValue){
                            setState(() {
                              isChecked = newValue;
                            });
                            if(isChecked == true){
                              services.add("Photo Editor");
                            }else if(isChecked==false){
                              services.remove("Photo Editor");
                            }
                          },
                          activeColor: mWhite,
                          checkColor: mOrange,
                          ),
                         const SizedBox(width: 10,),
                         Container(
                            width: SizeConfig.screenWidth!*0.8,
                            child:  TextField(
                              controller: _otherController,
                              ),
                            ),
                      ],
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
                        style: buttonOrange,
                        onPressed: ()async {
                         


                        },
                        child:Text('Sign up', style: mBold.copyWith(
                        color: mWhite, fontSize:SizeConfig.blocksHorizontal!*5),
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


 

   
