import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabang_application/data/booking.dart';
import 'package:tabang_application/utils/app_style.dart';
import 'package:tabang_application/utils/size_config.dart';
import 'package:carousel_slider/carousel_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _screenController = TextEditingController();

  List<TaskCategories> cat =[
    TaskCategories(
      icon: const Icon(Icons.video_camera_front, color: mBrightOrange, size: 40,),
      task: 'Video Editing',
      ),
      TaskCategories(
      icon: const Icon(Icons.camera_alt, color: mOrange, size: 40,),
      task: 'Photo Editing',
      ),
      TaskCategories(
      icon: const Icon(Icons.school, color: mOrange, size: 40,),
      task: 'Tutoring',
      ),
      TaskCategories(
      icon: const Icon(Icons.edit, color: mOrange, size: 40,),
      task: 'Logo Design',
      ),
      TaskCategories(
      icon: const Icon(Icons.delivery_dining, color: mOrange, size: 40,),
      task: 'Delivery',
      ),
      TaskCategories(
      icon: const Icon(Icons.shopping_bag, color: mOrange, size: 40,),
      task: 'Shopper',
      ),
      TaskCategories(
      icon: const Icon(Icons.house, color: mOrange, size: 40,),
      task: 'House Cleaning',
      ),
      TaskCategories(
      icon: const Icon(Icons.local_grocery_store, color: mOrange, size: 40,),
      task: 'Run Errands',
      ),
  ];

    List<BookingOption> booking =[
    BookingOption(
      service: 'Video Editing', 
      providerID: 's4yHnmurmtRQXnv7bI0vsFq8GCg2', 
      provider: 'Allyssa Echevarria', 
      rates: 150, 
      coverUrl: 'assets/Video-Editing.jpg',
      booked: 50,
      stars: 4,
      desc: 'Hi, I am a freelancer willing to edit any kind of videos and in any kinds of style so long as it remains under 5 minutes, just pm me for specifics',
      review: [
        Review(
          clientID: '4Ms8zRFHxxgiOG29FaNupgsSlZ73', 
          client: 'Natalie Dejos', 
          review: 'The video i recieved was great, will definetly book again!',
          stars: 3),
          Review(
          clientID: '4Ms8zRFHxxgiOG29FaNupgsSlZ73', 
          client: 'Zeirah Gerat', 
          review: 'Will definetly book again!',
          stars: 4),
      ],
      ),
      BookingOption(
      service: 'Logo Design', 
      providerID: 's4yHnmurmtRQXnv7bI0vsFq8GCg2', 
      provider: 'Maxene Borces', 
      rates: 200, 
      coverUrl: 'assets/logo-designing.jpg',
      booked: 50,
      stars: 4,
      desc: '',
      review: [],),
      BookingOption(
      service: 'Video Editing', 
      providerID: 's4yHnmurmtRQXnv7bI0vsFq8GCg2', 
      provider: 'Maxene Borces', 
      rates: 300, 
      coverUrl: 'assets/Video-Editing.jpg',
      booked: 200,
      stars: 4,
      desc: '',
      review: [],),
      BookingOption(
      service: 'Video Editing', 
      providerID: 's4yHnmurmtRQXnv7bI0vsFq8GCg2', 
      provider: 'Joan Borja', 
      rates: 150, 
      coverUrl: 'assets/Video-Editing.jpg',
      booked: 200,
      stars: 4,
      desc: "Hi, i am willing to edit videos in any style you wish so long as it it under 10 minutes",
      review: [
        Review(
          clientID: '4Ms8zRFHxxgiOG29FaNupgsSlZ73', 
          client: 'rhunnan liao', 
          review: 'The video i recieved was great, will definetly book again!',
          stars: 3),
          Review(
          clientID: '4Ms8zRFHxxgiOG29FaNupgsSlZ73', 
          client: 'Zeirah Gerat', 
          review: 'Will definetly book again!',
          stars: 4),
      ]),
      BookingOption(
      service: 'Photo Editing', 
      providerID: 's4yHnmurmtRQXnv7bI0vsFq8GCg2', 
      provider: 'Joan Borja', 
      rates: 100, 
      coverUrl: 'assets/photo-edit.png',
      booked: 10,
      stars:4,
      desc: "Hi, i can design a fun and colorful logo for your brand",
      review: []),
       BookingOption(
      service: 'Tutoring', 
      providerID: 's4yHnmurmtRQXnv7bI0vsFq8GCg2', 
      provider: 'Bryle Fernandes', 
      rates: 250, 
      coverUrl: 'assets/tutoring.jpg',
      booked: 100,
      stars: 3,
      desc: '',
      review: []),
      BookingOption(
      service: 'Help Moving', 
      providerID: 's4yHnmurmtRQXnv7bI0vsFq8GCg2', 
      provider: 'Bryle Fernandes', 
      rates: 400, 
      coverUrl: 'assets/help_moving.jpg',
      booked: 100,
      stars: 3,
      desc: '',
      review: []),
  ];


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
        SizedBox(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight!*1.5,
          child: Column(
            children: [
              Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight!*0.12,
                decoration: const BoxDecoration(
                  color: mOrange
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: SizeConfig.screenWidth!*0.8,
                      height: SizeConfig.blocksVertical!*5.5,
                      decoration:  BoxDecoration(
                        color: mWhite,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:  TextField(
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.left,
                        controller: _screenController,
                        decoration:  InputDecoration(
                          filled: false,
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(width: 0.2),
                          ),
                          label: Text("Search...",style: mRegular.copyWith(color: mGrey,fontSize: SizeConfig.blocksHorizontal!*4),),
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.search,color: mGrey,size: 25,),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: ((context) => SearchFilter(search: _screenController.text.trim().toLowerCase(),option: booking,))));
                            },
                            ),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.blocksHorizontal!*0.3,),
                    IconButton(
                      onPressed: (){

                      },
                       icon: const Icon(Icons.info_outline_rounded,color: mGrey,size: 25,))
                  ]),
              ),
             SizedBox(height: SizeConfig.blocksVertical!*3,),
              Expanded(
                child: Container(
                 child: CarouselSlider(
                  items: [1,2,3].map((e){
                    return Container(
                      margin: const EdgeInsets.only(left: 20,right: 20),
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(image: AssetImage('assets/photo-edit.png'),fit: BoxFit.cover)
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(height: 210)
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: SizeConfig.blocksHorizontal!*4,),
                  Text("Categories", style: mBold.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*5),),
                ],
              ),
              SizedBox(height: SizeConfig.blocksVertical!*5,),
              Container(
              margin: const EdgeInsets.only(left: 25),
              height: SizeConfig.blocksVertical!*40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: (cat.length / 2).ceil(),
                itemBuilder: (context, index) {
                  int firstIndex = index * 2;
                  int secondIndex = firstIndex + 1;
                  return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: ((context) => Caterogires(cat: cat[firstIndex].task.toLowerCase(), option:booking))));
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: index == 0 ? 0 : 25,),
                              height: 105,
                              width: 105,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: mWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  cat[firstIndex].icon,
                                  SizedBox(height: SizeConfig.blocksVertical! * 2),
                                  Text(
                                    cat[firstIndex].task,
                                    style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal! *3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.blocksVertical! * 3),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: ((context) => Caterogires(cat: cat[secondIndex].task.toLowerCase(), option:booking))));
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: index == 0 ? 0 : 20,),
                              height: 105,
                              width: 105,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: mWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  cat[secondIndex].icon,
                                  SizedBox(height: SizeConfig.blocksVertical! * 2),
                                  Text(
                                    cat[secondIndex].task,
                                    style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal! * 3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                },
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: SizeConfig.blocksHorizontal!*4,),
                  Text("Recommended", style: mBold.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*5),),
                ],
              ),
            SizedBox(height: SizeConfig.blocksVertical!*2,),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: booking.where((booking) => booking.stars >=4).length,
                  itemBuilder: (context,index){
                    final rates = booking[index].rates.toString();
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>MoreInfo(info: booking[index])));
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 30, bottom: 20),
                        margin: const EdgeInsets.only(left: 25),
                        height: 200,
                        width: SizeConfig.screenWidth!*0.85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(booking[index].coverUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(booking[index].service, style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*5),),
                            Row(
                            children: [
                              Text(booking[index].provider,style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal! * 4,),),
                              SizedBox(width: SizeConfig.blocksHorizontal! * 30,),
                              Text(rates,style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal! * 4,),)                          
                              ],
                          ),
                          ],
                        ),
                      ),
                    );
                  }),
              ),
            )
            ],
          ),
        ),
      ],
     ),
    );
  }
}

class Caterogires extends StatefulWidget {
  String cat;
  List<BookingOption> option;
  Caterogires({
    Key? key,
    required this.cat,
    required this.option,
  }) : super(key: key);

  @override
  State<Caterogires> createState() => _CaterogiresState();
}

class _CaterogiresState extends State<Caterogires> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight!*0.12,
              decoration: const BoxDecoration(
                color: mOrange
              ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset("assets/white_left_arrow.svg"),
            ),
            ],
          )
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.option.where((option) =>option.service.toLowerCase().contains(widget.cat)).length,
              itemBuilder: (context, index) {
                BookingOption option = widget.option.where((option) =>option.service.toLowerCase().contains(widget.cat)).toList()[index];
                final rates = option.rates.toString();
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MoreInfo(info: option)),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.only(left: 20,bottom: 20),
                    width: SizeConfig.screenWidth! * 0.5,
                    height: SizeConfig.screenHeight! * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(option.coverUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(option.service,style: mBold.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal! * 6,),),
                        Row(
                          children: [
                            Text(option.provider,style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal! * 4,),),
                            SizedBox(width: SizeConfig.blocksHorizontal! * 40,),
                            Text(rates,style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal! * 4,),)                          
                            ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



class MoreInfo extends StatefulWidget {
  BookingOption info;
  MoreInfo({super.key,
  required this.info});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  String dropdownvalue = 'now';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(widget.info.coverUrl),fit: BoxFit.cover),
              ),
            ) 
          ),
          Positioned(
            top:SizeConfig.screenHeight!/23.2,
            left: SizeConfig.screenHeight!/92.2,
            right: SizeConfig.screenHeight!/42.2,
            child: Row(
              children: [
                  IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: SvgPicture.asset("assets/white_left_arrow.svg")),
                IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_rounded, color: mWhite, size: 25,))
              ],
            )
          ),
          Positioned(
            left: 0,
            right: 0,
            top:300,
            child: Container(
              height: SizeConfig.screenHeight!*0.8,
              padding: const EdgeInsets.only(left: 30, right: 40, top:20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: mWhite ,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.blocksVertical!*1,),
                  Text(widget.info.service, style: mBold.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*6, letterSpacing: 2),),
                  SizedBox(height: SizeConfig.blocksVertical!*2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.info.provider, style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*3.5),),
                      Text(widget.info.rates.toString(),style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*3.5),)
                    ],
                  ),
                  SizedBox(height: SizeConfig.blocksVertical!*1,),
                  Row(
                    children: [
                      ...List.generate(widget.info.stars,(index) => const Icon(Icons.star, color: mOrange, size: 20)),
                      SizedBox(width: SizeConfig.blocksHorizontal!*2,),
                      Text(widget.info.booked.toString(), style: mRegular.copyWith(color: mGrey,fontSize: SizeConfig.blocksHorizontal!*3.5),),
                      SizedBox(width: SizeConfig.blocksHorizontal!*4,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ReviewPage(info:widget.info)));
                        },
                        child: Text("Reviews", style: mRegular.copyWith(color: mGrey, fontSize: SizeConfig.blocksHorizontal!*3.5),)
                        ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.blocksVertical!*2,),
                  Text(widget.info.desc,style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*3.5)),
                  SizedBox(height: SizeConfig.blocksVertical!*2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text("Time", style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*3.5),),
                        DropdownButton<String>(
                        style: const TextStyle( color: mBlack),
                        underline: Container(height: 2, color: mBlack,),
                        value: dropdownvalue,
                        items: const[
                          DropdownMenuItem<String>(
                            value: 'now',
                            child: Text("now")
                            ),
                            DropdownMenuItem<String>(
                            value: '1:00pm',
                            child: Text("1:00pm")
                            ),
                             DropdownMenuItem<String>(
                            value: '2:00pm',
                            child: Text("2:00pm")
                            ),
                            DropdownMenuItem<String>(
                            value: '4:00pm',
                            child: Text("4:00pm")
                            ),
                        ], 
                        onChanged: (String? newValue){
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        }
                        ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.blocksHorizontal!*4,),
                  GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PayementDetails()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Payment Details", style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*3.5),),
                        const Icon(Icons.arrow_forward_ios, color: mBlack,size: 15,),
                      ],
                      ),
                  ),
                 SizedBox(height: SizeConfig.blocksHorizontal!*9,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 50), 
                        backgroundColor: mBrightOrange,
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(mBorderRadius),),
                        ),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                      },
                       child: Text("Book", style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*5),)),
                   ],
                 ),
                ],
              ),
            ),
            ),
        ],
      )
    );
  }
}

class ReviewPage extends StatelessWidget {
  BookingOption info;
  ReviewPage({super.key,
  required this.info});

  @override
  Widget build(BuildContext context) {
    List<Review> review = info.review;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
               padding: const EdgeInsets.only(left: 10, top: 30),
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                    IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: SvgPicture.asset("assets/orange_left_arrow.svg")),
                  SizedBox(width: SizeConfig.blocksHorizontal!*4,),
                  Text("Reviews", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*6),),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: review.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      height: SizeConfig.screenHeight!*0.2,
                      width: SizeConfig.screenWidth!*0.7,
                      margin: const EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        color: mWhite,
                        boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ], 
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(review[index].client, style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*5),),
                              ...List.generate(review[index].stars,(index) => const Icon(Icons.star, color: mOrange, size: 20)),
                            ],
                          ),
                          SizedBox(height: SizeConfig.blocksHorizontal!*3,),
                          Text(review[index].review, style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*4),),
                        ],
                      ),
                    );
                  })))
            ],
            ),
            ),
          ],
        ),
      )
    );
  }
}

class PayementDetails extends StatelessWidget {
  PayementDetails({super.key});

  bool payment = false;
  bool payment2 =false; 
  bool payment3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 10, top: 30),
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                  IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: SvgPicture.asset("assets/orange_left_arrow.svg")),
                SizedBox(width: SizeConfig.blocksHorizontal!*4,),
                Text("Payment Details", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*6),),
              ],
            ),
            SizedBox(height: SizeConfig.blocksHorizontal!*7,),
            Container(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: Column(
                children: [
                Row(
                children: [
                  const Icon(Icons.attach_money_outlined, color: mBlack,size: 25,),
                  SizedBox(width: SizeConfig.blocksHorizontal!*3,),
                  Text("Cash", style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*4.5),),
                  SizedBox(width: SizeConfig.blocksHorizontal!*50,),
                  Checkbox(value: payment, onChanged: (bool? newValue){
                    payment = newValue!;
                  })
                ]),
                SizedBox(height: SizeConfig.blocksHorizontal!*7,),
                Row(
                children: [
                  const Icon(Icons.paypal, color: mBlack,size: 25,),
                  SizedBox(width: SizeConfig.blocksHorizontal!*3,),
                  Text("GCash", style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*4.5),),
                  SizedBox(width: SizeConfig.blocksHorizontal!*47,),
                  Checkbox(value: payment2, onChanged: (bool? newValue){
                    payment2 = newValue!;
                  })
                ]),
                SizedBox(height: SizeConfig.blocksHorizontal!*7,),  
                Row(
                children: [
                  const Icon(Icons.credit_card, color: mBlack,size: 25,),
                  SizedBox(width: SizeConfig.blocksHorizontal!*3,),
                  Text("Cards", style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*4.5),),
                  SizedBox(width: SizeConfig.blocksHorizontal!*49,),
                  Checkbox(value: payment3, onChanged: (bool? newValue){
                    payment3 = newValue!;
                  })
                ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//makes the system crash
class SearchFilter extends StatefulWidget {
  String search;
  List<BookingOption> option;
  SearchFilter({super.key,
  required this.search,
  required this.option});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  final _screenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight!*0.12,
              decoration: const BoxDecoration(
                color: mOrange
              ),
              child: Row(
                children: [
                  IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: SvgPicture.asset("assets/white_left_arrow.svg")),
                  Container(
                    width: SizeConfig.screenWidth!*0.7,
                    height: SizeConfig.blocksVertical!*5.5,
                    decoration:  BoxDecoration(
                      color: mWhite,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:  TextField(
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.left,
                      controller: _screenController,
                      decoration:  InputDecoration(
                        filled: false,
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(width: 0.2),
                        ),
                        label: Text("Search...",style: mRegular.copyWith(color: mGrey,fontSize: SizeConfig.blocksHorizontal!*4),),
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.search,color: mGrey,size: 25,),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => SearchFilter(search: _screenController.text.trim().toLowerCase(), option: widget.option,))));
                          },
                          ),
                      ),
                    ),
                  ),
                  SizedBox(width: SizeConfig.blocksHorizontal!*0.3,),
                  IconButton(
                    onPressed: (){

                    },
                     icon: const Icon(Icons.filter_list_rounded,color: mGrey,size: 25,))
                ]),
            ),
           SizedBox(height: SizeConfig.blocksVertical!*4,),
           Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.option.where((option) =>option.service.toLowerCase().contains(widget.search)).length,
              itemBuilder: (context, index) {
                BookingOption option = widget.option.where((option) =>option.service.toLowerCase().contains(widget.search)).toList()[index];
                final rates = option.rates.toString();
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MoreInfo(info: option)),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.only(left: 20,bottom: 20),
                    width: SizeConfig.screenWidth! * 0.5,
                    height: SizeConfig.screenHeight! * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(option.coverUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(option.service,style: mBold.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal! * 6,),),
                        Row(
                          children: [
                            Text(option.provider,style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal! * 4,),),
                            SizedBox(width: SizeConfig.blocksHorizontal! * 40,),
                            Text(rates,style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal! * 4,),)                          
                            ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
          ],
        ),
    );
  }
}


