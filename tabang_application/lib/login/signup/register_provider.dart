import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tabang_application/utils/app_style.dart';
import 'package:tabang_application/login/role_management.dart';
import 'package:tabang_application/utils/size_config.dart';
import 'package:tabang_application/utils/utils.dart';



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

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _contactNumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
              padding: const EdgeInsets.only(left: 20),
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
                      ],
                    ),
                    ),
                ],
              ),
            ),
            const SizedBox(height:70,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                        OutlinedButton(
                        style: buttonOutlinedOrange,
                        onPressed: ()async {
                          if(_formkey.currentState!.validate()){
                            Navigator.of(context).push (MaterialPageRoute(builder: (context)=>RegisterProviderTwo(
                            firstName: _firstNameController.text.trim(),
                            lastName: _lastNameController.text.trim(),
                            contactNum: _contactNumController.text.trim(),
                          )));
                        }else{
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            title: 'Unfilled Form',
                            text: 'Please enter all the information required',
                          );
                        } 
                        },
                        child:Text('Next', style: mBold.copyWith(
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

class RegisterProviderTwo extends StatefulWidget {
  String firstName,lastName,contactNum;
  RegisterProviderTwo({super.key,
  required this.firstName,
  required this.lastName,
  required this.contactNum});

  @override
  State<RegisterProviderTwo> createState() => _RegisterProviderTwoState();
}

class _RegisterProviderTwoState extends State<RegisterProviderTwo> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  Uint8List? _image;

  bool isVisible = false;
  bool isObscure = true;
  bool isObscure2 = true;



bool confirmPass(){
  if(_passwordController.text.trim()== _confirmPasswordController.text.trim()){
    return true;
  }else{
    return false;
  }
}

  selectImage()async{
  Uint8List im = await pickImage(ImageSource.gallery);
  setState(() {
    _image =im;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          decoration: const BoxDecoration(
            color: mWhite
            ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(height: SizeConfig.blocksVertical!*0.5,),
              Row(children: [
              IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: SvgPicture.asset("assets/orange_left_arrow.svg")),
              ]),  
                Form(
                  key: _formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children:[
                              _image!=null?CircleAvatar(
                              radius: 64,
                              backgroundImage: MemoryImage(_image!),
                            )
                            : const CircleAvatar(
                              radius: 64,
                              backgroundColor: mGrey,
                            ),
                            Positioned(
                              bottom: -10,
                              left: 80,
                              child: IconButton(
                                  onPressed: selectImage,
                                  icon: const Icon(Icons.add_a_photo)),
                            ),],),
                          ],
                        ), 
                        SizedBox(height: SizeConfig.blocksVertical!*5,),
                            Text("Email Address", style: mRegular.copyWith(color: mOrange,fontSize: SizeConfig.blocksHorizontal!*4.5,),),
                            SizedBox(
                              width: SizeConfig.screenWidth!*0.8,
                              child: TextField(
                                style: const TextStyle(color: mOrange),
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(      
                                    borderSide: BorderSide(color:mOrange),   
                                    ), 
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blocksVertical!*6,),
                            Text("Password", style: mRegular.copyWith(color: mOrange,fontSize: SizeConfig.blocksHorizontal!*4.5),),
                            SizedBox(
                              width: SizeConfig.screenWidth!*0.8,
                              child: TextField(
                                style: const TextStyle(color: mOrange),
                                controller: _passwordController,
                                obscureText: isObscure,
                                decoration:  InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(      
                                    borderSide: BorderSide(color:mOrange),   
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
                            SizedBox(height: SizeConfig.blocksVertical!*6,),
                            Text("Confirm Password", style: mRegular.copyWith(color: mOrange,fontSize: SizeConfig.blocksHorizontal!*4.5),),
                            SizedBox(
                              width: SizeConfig.screenWidth!*0.8,
                              child: TextField(
                                style: const TextStyle(color: mOrange),
                                obscureText: isObscure2,
                                controller: _confirmPasswordController,
                                decoration:  InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(      
                                    borderSide: BorderSide(color:mOrange),   
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
                        SizedBox(height: SizeConfig.blocksVertical!*6,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center ,
                          children: [
                            OutlinedButton(
                              style: buttonOutlinedOrange,
                              onPressed: (){
                               if(_formkey.currentState!.validate()){
                                if(confirmPass()){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceChoice(
                                firstName: widget.firstName,
                                lastName: widget.lastName,
                                contactNum: widget.contactNum,
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                                // image: _image!
                                )));
                              }else{
                                 QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.error,
                                  title: 'Incorrect password',
                                  text: 'Password and confrim password dont match',
                                );
                              }}else{
                                QuickAlert.show(
                                context: context,
                                type: QuickAlertType.error,
                                title: 'Unfilled Form',
                                text: 'Please enter all the information required',
                              );
                              }
                              },
                               child: Text("Next", style: mBold.copyWith(color: mOrange, fontSize: SizeConfig.blocksHorizontal!*4),)),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
            ],),
      ),
    );
  }
}


class ServiceChoice extends StatefulWidget {
  String firstName, lastName, contactNum, email,password;
  // Uint8List image;
  ServiceChoice({super.key, 
  required this.firstName,
  required this.lastName,
  required this.contactNum,
  required this.email,
  required this.password,
  // required this.image,
  });

  @override
  State<ServiceChoice> createState() => _ServiceChoiceState();
}

class _ServiceChoiceState extends State<ServiceChoice> {

  late DocumentReference _documentReference;
  late CollectionReference _collectionReference;

  final services =[
    CheckBoxState(title: 'House Cleaning', rates: 200),
    CheckBoxState(title: 'Personal Shopper', rates: 100),
    CheckBoxState(title: 'Delivery', rates: 80),
    CheckBoxState(title: 'Run Errands', rates: 100),
    CheckBoxState(title: 'Tutoring', rates: 200), 
    CheckBoxState(title: 'Video Editing', rates: 150),
    CheckBoxState(title: 'Photo Editing', rates: 100),
    CheckBoxState(title: 'Logo Design', rates: 200),

  ];
  
  Future register()async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: widget.email, 
      password: widget.password,
      );

     await Future.delayed(const Duration(seconds: 2));


      postUnverifiedProvider(context);
    } catch(e){
      print(e);
  }
}

    void postUnverifiedProvider(BuildContext context){
    final user = FirebaseAuth.instance.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({
      'firstName': widget.firstName,
      'lastName':widget.lastName,
      'contactNum':widget.contactNum,
      'email':widget.email,
      'role': 'Service Provider',
      'verified': '0',
      // 'file', widget.img!
      });
      sendto(context);
}
  
Map<String, dynamic> data = {
  "service": '', 
  'rates': 0,
  'desc': '',
};

  void sendto(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SendEmailVerification()),
  );
}

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 255, 106, 0),mOrange,mBrightOrange,mYellow],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft
            ),
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Row(children: [
              IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: SvgPicture.asset("assets/white_left_arrow.svg")),
            ],),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 10,),
                        Text("Services", style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*10),),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 10,),
                        Text("Select the services you wish to provide", style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4)),
                      ],
                    ),
                   ...services.map(buildSingleCheckBox),
                   
                   const SizedBox(height: 20,),

                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       OutlinedButton(
                        style: buttonOutlinedWhite,
                        onPressed: ()async{

                          register();
                          for(int i=0; i<services.length;i++){
                            if(services[i].value == true){
                              data.update("service", (value)=> value = services[i].title);
                              data.update("rates", (value)=> value = services[i].rates);
                              // postUnverifiedService(data);
                            }
                          }
                        },
                         child: Text("Submit", style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4),)),
                     ],
                   )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  CheckboxListTile buildSingleCheckBox(CheckBoxState checkbox) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: mWhite,
      checkColor: mOrange,
      value: checkbox.value, 
      title: Text(checkbox.title, style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!* 4),),
      onChanged: (value){
        setState(() {
          checkbox.value = value!;
        });
      });
  }
}

class CheckBoxState{
  final String  title;
  int rates;
  bool value;

  CheckBoxState({
    required this.title,
    required this.rates,
    this.value = false,
  });
}