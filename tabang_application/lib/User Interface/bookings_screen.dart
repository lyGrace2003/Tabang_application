import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabang_application/User%20Interface/home_screen.dart';
import 'package:tabang_application/data/booking.dart';
import 'package:tabang_application/data/visible.dart';
import 'package:provider/provider.dart';
import 'package:tabang_application/utils/app_style.dart';
import 'package:tabang_application/utils/size_config.dart';


class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  final _screenController = TextEditingController();

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

  List<Booking> curr =[
    Booking(
      service: 'Video Editing',
      providerID: 's4yHnmurmtRQXnv7bI0vsFq8GCg2',
      provider: 'Allyssa Echevarria',
      clientID: '4Ms8zRFHxxgiOG29FaNupgsSlZ73',
      client: 'rhunnan liao',
      rates: '150',
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
  ];

  List<Booking> history =[
    Booking(
      service: 'Photo Editing',
      providerID: 's4yHnmurmtRQXnv7bI0vsFq8GCg2',
      provider: 'Joan Borja',
      clientID: '4Ms8zRFHxxgiOG29FaNupgsSlZ73',
      client: 'rhunnan liao',
      rates: '100',
      coverUrl: 'assets/photo-edit.png',
      booked: 10,
      stars:4,
      desc: "Hi, i can design a fun and colorful logo for your brand",
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
      Booking(
      service: 'Tutoring',
      providerID: 's4yHnmurmtRQXnv7bI0vsFq8GCg2',
      provider: 'Bryle Fernandes',
      clientID: '4Ms8zRFHxxgiOG29FaNupgsSlZ73',
      client: 'rhunnan liao',
      rates: '300',
      coverUrl: 'assets/tutoring.jpg',
      booked: 100,
      stars: 3,
      desc: '',
      review: []),
  ];

  @override
  Widget build(BuildContext context) {
    final visibilityProvider = Provider.of<VisibilityProvider>(context);
    SizeConfig().init(context);

    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
                  ],
                ),
            ),
            SizedBox(height: SizeConfig.blocksVertical!*2,),
                Text("Current Booking", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*6),),
                SizedBox(height: SizeConfig.blocksVertical!*2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    visibilityProvider.getContainerVisibility('container1')
                     ?  GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>CurrInfoUser(curr: curr[0]))),
                      child: Container(
                        padding: const EdgeInsets.only(left:20, bottom: 20),
                        width: SizeConfig.screenWidth!*0.94,
                        height: SizeConfig.screenHeight!*0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: AssetImage(curr[0].coverUrl),fit: BoxFit.cover),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(curr[0].service, style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*6)),
                            Row(
                              children: [
                                Text(curr[0].provider, style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4),),
                                SizedBox(width: SizeConfig.blocksHorizontal!*30,),
                                Text(curr[0].rates, style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4),),
                                SizedBox(width: SizeConfig.blocksHorizontal!*2,),
                              ]
                            ),
                          ],
                        ),
                      ),
                    )
                    : Container(width: SizeConfig.screenWidth!*0.9,
                        height: SizeConfig.screenHeight!*0.3,),
                  ],
                ),
                SizedBox(height: SizeConfig.blocksVertical!*1,),
                Text("Previous Bookings", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*5),),
                SizedBox(height: SizeConfig.blocksVertical!*1,),
                Expanded(
                  child: HistoryUser(history: history),
                ),
        ],
      ),
    ),
      )
  );
  }
}

class CurrInfoUser extends StatelessWidget {
  Booking curr;
  CurrInfoUser({super.key,
  required this.curr});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
               padding: const EdgeInsets.only(left: 10, top: 30, right: 10),
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: SvgPicture.asset("assets/orange_left_arrow.svg")),
                  IconButton(onPressed: (){
                    PopupMenuButton(
                      itemBuilder:(context)=>[
                        PopupMenuItem(
                          child: Center(child: Text("Phone call", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*4),))),
                        PopupMenuItem(
                          child: Center(child: Text("Chat", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*4),))),
                          PopupMenuItem(
                          child: Center(child: Text("Phone call", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*4),))),
                      ] ,
                      );
                  }, icon: Icon(Icons.phone, size: 30, color: mOrange,)),
                ],
              ),
              Container(
                height: SizeConfig.screenHeight!*0.4,
                width: SizeConfig.screenWidth,
                child: Center(
                  child: Text("In Progress",style: mBold.copyWith(color: mOrange, fontSize: SizeConfig.blocksHorizontal!*9, letterSpacing: 2),),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left:20, top: 20),
                height: 2,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  color: mGrey.withOpacity(0.5),
                ),
                child: Column(
                  children: [
                    Text(curr.service, style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*4),),
                  ],
                ),
              )
            ],
          ),
          )
      ]),
    );
  }
}

class HistoryUser extends StatelessWidget {
  List<Booking> history;
  HistoryUser({super.key,
  required this.history});

  @override
  Widget build(BuildContext context) {
    final visibilityProvider = Provider.of<VisibilityProvider>(context);

    return Consumer<VisibilityProvider>(
      builder: (context, provider, _) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: provider.getContainerVisibility('container4') ? history.length + 1 : history.length,
          itemBuilder: (context, index) {
            if (provider.getContainerVisibility('container4') && index == 0) {
              return Container(
                margin: EdgeInsets.only(left: 20),
                width: SizeConfig.screenWidth! * 0.88,
                height: SizeConfig.screenHeight! * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(image: AssetImage("assets/Video-Editing.jpg"), fit: BoxFit.cover),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Video Editing",style: mBold.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal! * 6,),),
                    Row(
                      children: [
                        Text("Allyssa Echevarria",style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal! * 4,),),
                        SizedBox(width: SizeConfig.blocksHorizontal! * 30),
                        Text("150",style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal! * 4,),),
                        SizedBox(width: SizeConfig.blocksHorizontal! * 2),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              Booking prev = history[provider.getContainerVisibility('container4') ? index - 1 : index];
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MoreInfoHistory(info: prev)));
                },
                child: Container(
                  margin: EdgeInsets.only(left: index == 0 ? 0 : 20),
                  padding: const EdgeInsets.only(left: 30),
                  width: SizeConfig.screenWidth! * 0.9,
                  height: SizeConfig.screenHeight! * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(prev.coverUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(prev.service,style: mBold.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal! * 6,),),
                      Row(
                        children: [
                          Text(prev.provider,style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal! * 4,),),
                          SizedBox(width: SizeConfig.blocksHorizontal! * 30),
                          Text(prev.rates,style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal! * 4,),),
                          SizedBox(width: SizeConfig.blocksHorizontal! * 2),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}

class MoreInfoHistory extends StatefulWidget {
  Booking info;
  MoreInfoHistory({super.key,
  required this.info});

  @override
  State<MoreInfoHistory> createState() => _MoreInfoHistoryState();
}

class _MoreInfoHistoryState extends State<MoreInfoHistory> {
  String dropdownvalue = "now";
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ReviewPageHistory(info:widget.info)));
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

class ReviewPageHistory extends StatelessWidget {
  Booking info;
  ReviewPageHistory({super.key,
  required this.info});

  @override
  Widget build(BuildContext context) {
    final _reviewController = TextEditingController();
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
                  }))),
                  Row(
              children: [
                Text("Leave a Review",style: mRegular.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal!*4,)),
                SizedBox(width: SizeConfig.blocksHorizontal!*5,),
                ...List.generate(5,(index) => const Icon(Icons.star_border, color: mBlack, size: 20)),
            ],
            ),
            TextFormField(
              minLines: 2,
              maxLines: 4,
              style: const TextStyle(color: mBlack),
              controller: _reviewController,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(      
                  borderSide: BorderSide(color:mBlack),   
                  ), 
              ),
            ),
            SizedBox(height: SizeConfig.blocksVertical!*5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: buttonOutlinedOrange,
                  onPressed: (){
                    Navigator.pop(context);
                },
                 child: Text("Submit Review", style: mBold.copyWith(color: mOrange, fontSize: SizeConfig.blocksHorizontal!*4),)),
              ],
            ),
            SizedBox(height: SizeConfig.blocksVertical!*5,),
                ],
               ),
            ),
          ],
        ),
      )
    );
  }
}