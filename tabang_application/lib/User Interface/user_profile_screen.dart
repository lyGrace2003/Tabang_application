import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabang_application/data/user.dart';
import 'package:tabang_application/utils/app_style.dart';
import 'package:tabang_application/utils/size_config.dart';

class ClientProfile extends StatefulWidget {
  const ClientProfile({super.key});

  @override
  State<ClientProfile> createState() => _ClientProfileState();
}

class _ClientProfileState extends State<ClientProfile> {
  List<Client> clients =[
  Client(
    firstName: 'rhunnan', 
    lastName: 'liao', 
    contact: '0943257393', 
    email: 'rhunnandwight.liao.21@usjr.edu.ph', 
    profilepic: 'assets/default_profile.png')
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top:50,),
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: SizeConfig.blocksHorizontal!*5,),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: AssetImage(clients[0].profilepic), fit: BoxFit.cover)
                    ),
                  ),
                  SizedBox(width: SizeConfig.blocksHorizontal!*5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${clients[0].firstName} ${clients[0].lastName}', style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*5),),
                      SizedBox(height: SizeConfig.blocksVertical!*1,),
                      Text(clients[0].contact, style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*3.5),),
                      Text(clients[0].email, style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*3.5),),
                    ],
                  ),
              ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile(client: clients)));
                    }, 
                    icon: const Icon(Icons.edit,color: mOrange,size: 25.0,)
                  ),
                    IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.settings,color: mOrange,size: 25.0,)
                  ),
                ],
              ),
            ],
      ),
        ),
      ),
    );
  }
}

  class EditProfile extends StatelessWidget {
  List<Client> client;
  EditProfile({super.key,
  required this.client});

  final _contactNumController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: Column(
              children: [
                const SizedBox(height: 20,),
                  Row(children: [
                  IconButton(onPressed: () {
                      Navigator.pop(context);
                    }, icon: SvgPicture.asset("assets/orange_left_arrow.svg")),
                ],),
               Stack(
                children:[
                Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: AssetImage(client[0].profilepic), fit: BoxFit.cover)
                      ),
                    ),
              Positioned(
                bottom: -10,
                left: 80,
                child: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.add_a_photo, color: mBlack,size: 30,)),
              ),],),
              SizedBox(height: SizeConfig.blocksVertical!*10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              SizedBox(
                width: SizeConfig.screenWidth!*0.8,
                child: TextField(
                  style: const TextStyle(color: mBlack),
                  controller: _firstNameController,
                  decoration:  InputDecoration(
                    label: Text("First Name", style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*4.5,),),
                    enabledBorder:const UnderlineInputBorder(      
                      borderSide: BorderSide(color:mBlack),   
                      ), 
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.blocksVertical!*6,),
              
              SizedBox(
                width: SizeConfig.screenWidth!*0.8,
                child: TextField(
                  style: const TextStyle(color: mBlack),
                  controller: _lastNameController,
                  decoration:  InputDecoration(
                    label: Text("Last Name", style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*4.5,),),
                    enabledBorder:const UnderlineInputBorder(
                      borderSide: BorderSide(color:mBlack),   
                      ), 
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.blocksVertical!*6,),
              SizedBox(
                width: SizeConfig.screenWidth!*0.8,
                child: TextField(
                  style: const TextStyle(color: mBlack),
                  controller: _contactNumController,
                  decoration: InputDecoration(
                    label: Text("Contact Number", style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*4.5,),),
                    enabledBorder:const UnderlineInputBorder(      
                      borderSide: BorderSide(color:mBlack),   
                      ), 
                  ),
                ),
              ),
                ],
              ),
              SizedBox(height: SizeConfig.blocksVertical!*6,),
              ElevatedButton(
                style: buttonOrange,
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Save",style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4),))
              ],
            ),
          ),
      )
      );
  }
}