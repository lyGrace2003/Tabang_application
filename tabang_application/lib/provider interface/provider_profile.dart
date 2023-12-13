import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabang_application/data/user.dart';
import 'package:tabang_application/utils/app_style.dart';
import 'package:tabang_application/utils/size_config.dart';

class ProvderProfile extends StatefulWidget {
  const ProvderProfile({super.key});

  @override
  State<ProvderProfile> createState() => _ProvderProfileState();
}

class _ProvderProfileState extends State<ProvderProfile> {

  final _taskController = TextEditingController();
  final _credentialController = TextEditingController();

  List<Provider> pro =[
    Provider(
      firstName: 'Allyssa',
      lastName: 'Echevarria',
      contact: '09433283155',
      email: 'Allyssagrace2003@gmail.com',
      profilepic: 'assets/default_profile.png',
      task: [
        Task(
          provider: 'Allyssa Echevarria',
          service: 'Video Editing', 
          rates: '150', 
          cover: 'assets/Video-Editing.jpg', 
          desc: 'Hi, I can edit your videos for you so long as it remains under 5 minutes, just make sure to message me regarding the style you would like'),
        Task(
          provider: 'Allyssa Echevarria',
          service: 'Tutoring', 
          rates: '200', 
          cover: 'assets/tutoring.jpg', 
          desc: 'I offer both online and face-to-face tutoring on the basics of programming'),
           Task(
          provider: 'Allyssa Echevarria',
          service: 'Logo Design', 
          rates: '200', 
          cover: 'assets/logo-designing.jpg', 
          desc: 'I will make a timeless logo'),
      ],
      )
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
                      image: DecorationImage(image: AssetImage(pro[0].profilepic), fit: BoxFit.cover)
                    ),
                  ),
                  SizedBox(width: SizeConfig.blocksHorizontal!*5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${pro[0].firstName} ${pro[0].lastName}', style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*5),),
                      SizedBox(height: SizeConfig.blocksVertical!*1,),
                      Text(pro[0].contact, style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*3.5),),
                      Text(pro[0].email, style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*3.5),),
                    ],
                  ),
              ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProviderProfile(pro:pro)));
                    }, 
                    icon: const Icon(Icons.edit,color: mOrange,size: 25.0,)
                  ),
                    IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.settings,color: mOrange,size: 25.0,)
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.blocksVertical!*2),
              Container(
                height: 1,
                width: SizeConfig.screenWidth,
                color: mGrey,
              ),
              SizedBox(height: SizeConfig.blocksVertical!*5 ,),
              Row(
                children: [
                  SizedBox(width: SizeConfig.blocksHorizontal!*5,),
                  Text("My Tasks", style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*6),),
                  SizedBox(width: SizeConfig.blocksHorizontal!*45,),
                  IconButton(
                    onPressed: (){
                      showModalBottomSheet(
                        context: context, 
                        builder: (context){
                          return Container(
                            padding: const EdgeInsets.only(left: 30),
                            height: SizeConfig.screenHeight!*0.8,
                            width: SizeConfig.screenWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height:SizeConfig.blocksVertical!*3),
                                Text("Add Task", style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*5),),
                                SizedBox(height:SizeConfig.blocksVertical!*3),
                                SizedBox(
                                  width: SizeConfig.screenWidth!*0.8,
                                  child: TextField(
                                    style: const TextStyle(color: mBlack),
                                    controller: _taskController,
                                    decoration: InputDecoration(
                                      label: Text("Task",style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*4,),),
                                      enabledBorder: const UnderlineInputBorder(      
                                        borderSide: BorderSide(color:mBlack),   
                                        ), 
                                    ),
                                  ),
                                ),
                                SizedBox(height:SizeConfig.blocksVertical!*3),
                                SizedBox(
                                  width: SizeConfig.screenWidth!*0.8,
                                  child: TextFormField(
                                    minLines: 1,
                                    maxLines: 3,
                                    style: const TextStyle(color: mBlack),
                                    controller: _credentialController,
                                    decoration: InputDecoration(
                                      label: Text("Credentials",style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*4,),),
                                      enabledBorder: const UnderlineInputBorder(      
                                        borderSide: BorderSide(color:mBlack),   
                                        ), 
                                    ),
                                  ),
                                ),
                                SizedBox(height:SizeConfig.blocksVertical!*3),
                                SizedBox(
                                  width: SizeConfig.screenWidth!*0.8,
                                  child: TextField(
                                    style: const TextStyle(color: mBlack),
                                    controller: _credentialController,
                                    decoration: InputDecoration(
                                      label: Text("Upload Image",style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*4,),),
                                      enabledBorder: const UnderlineInputBorder(      
                                        borderSide: BorderSide(color:mBlack),   
                                        ), 
                                        suffixIcon: IconButton(
                                          onPressed: (){},
                                          icon: const Icon(Icons.image,size: 20,color: mBlack,),
                                          ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: SizeConfig.blocksVertical!*4,),
                                Row(
                                  children: [
                                SizedBox(width: SizeConfig.screenWidth!*0.18,),
                                ElevatedButton(
                                  style: buttonOrange,
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text("Add",style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4),))
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        );
                    },
                    icon: const Icon(Icons.add_circle,color: mOrange,size: 30,))
                ],
              ),
              Expanded(child: listTask(task:pro[0].task))
            ],
          ),
        ),
      ),
    );
  }
}

//need to simulate unverified task being added after

class listTask extends StatelessWidget {
  List<Task> task;
  listTask({super.key,
  required this.task});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: task.length,
      itemBuilder: (context,index){
        Task serv = task[index];
            return Container(
              margin: EdgeInsets.only(bottom: index == 0 ? 0 : 20, top:index == 0 ? 0 : 20 ),
              padding: const EdgeInsets.only(left:30),
                width: SizeConfig.screenWidth!*0.8,
                height: SizeConfig.screenHeight!*0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: AssetImage(serv.cover),fit: BoxFit.cover),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(serv.service, style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*6)),
                    Row(
                      children: [
                        Text(serv.provider, style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4),),
                        SizedBox(width: SizeConfig.blocksHorizontal!*30,),
                        Text(serv.rates, style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4),),
                        SizedBox(width: SizeConfig.blocksHorizontal!*2,),
                        IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.info_rounded, size: 20.0,color: mWhite,))
                      ],
                    ),
                  ],
                ),
            );
      });
  }
}

class EditProviderProfile extends StatelessWidget {
  List<Provider> pro;
  EditProviderProfile({super.key,
  required this.pro});

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
                        image: DecorationImage(image: AssetImage(pro[0].profilepic), fit: BoxFit.cover)
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
                  decoration: InputDecoration(
                    label: Text("First Name", style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*4.5,),),
                    enabledBorder: const UnderlineInputBorder(      
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
                  decoration:  InputDecoration(
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
