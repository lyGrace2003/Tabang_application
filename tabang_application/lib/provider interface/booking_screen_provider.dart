import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabang_application/User%20Interface/home_screen.dart';
import 'package:tabang_application/data/booking.dart';
import 'package:tabang_application/data/visible.dart';
import 'package:tabang_application/utils/app_style.dart';
import 'package:tabang_application/utils/size_config.dart';
import 'package:provider/provider.dart';

class BookingsProvider extends StatefulWidget {
  const BookingsProvider({super.key});

  @override
  State<BookingsProvider> createState() => _BookingsProviderState();
}


class _BookingsProviderState extends State<BookingsProvider> {


  List<Booking> curr =[
    Booking(
      service: 'Video Editing',
      providerID: 's4yHnmurmtRQXnv7bI0vsFq8GCg2',
      provider: 'Allyssa Echevarria',
      clientID: '4Ms8zRFHxxgiOG29FaNupgsSlZ73',
      client: 'rhunnan liao',
      rates: '150',
      coverUrl: 'assets/Video-Editing.jpg',
      booked: 0,
      review: [],
      desc: '',
      stars: 0)
  ];

  List<Booking> history =[
    Booking(
      service: 'Tutoring',
      providerID: 's4yHnmurmtRQXnv7bI0vsFq8GCg2',
      provider: 'Allyssa Echevarria',
      clientID: '4Ms8zRFHxxgiOG29FaNupgsSlZ73',
      client: 'rhunnan liao',
      rates: '200',
      coverUrl: 'assets/tutoring.jpg',
      booked: 0,
      review: [],
      desc: '',
      stars: 0),
      Booking(
      service: 'Video Editing',
      providerID: 's4yHnmurmtRQXnv7bI0vsFq8GCg2',
      provider: 'Allyssa Echevarria',
      clientID: '4Ms8zRFHxxgiOG29FaNupgsSlZ73',
      client: 'Zeirah Gerat',
      rates: '200',
      coverUrl: 'assets/Video-Editing.jpg',
      booked: 0,
      review: [],
      desc: '',
      stars: 0)
  ];

 
  @override
  Widget build(BuildContext context) {
     final visibilityProvider = Provider.of<VisibilityProvider>(context);
    SizeConfig().init(context);

    return Scaffold(
      body:ListView(
        children: [ Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.blocksVertical!*2,),
                Text("Current Booking", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*6),),
                SizedBox(height: SizeConfig.blocksVertical!*2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    visibilityProvider.getContainerVisibility('container1')
                     ?  GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>CurrInfo(curr: curr))),
                      child: Container(
                        width: SizeConfig.screenWidth!*1,
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
                                Text(curr[0].client, style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4),),
                                Text(curr[0].rates, style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4),),
                                SizedBox(width: SizeConfig.blocksHorizontal!*1,),
                                IconButton(
                                  onPressed: (){},
                                  icon: const Icon(Icons.info_rounded, size: 20.0,color: mWhite,))
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    : Container(width: SizeConfig.screenWidth!*0.9,
                        height: SizeConfig.screenHeight!*0.3,),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>PendingBooking())),
                  child: Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight!*0.2,
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pending Bookings", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*5),),
                      const Icon(Icons.arrow_forward_ios, size: 20.0,color: mBrightOrange,),
                    ],
                  ),
                ),
                ),
                SizedBox(height: SizeConfig.blocksVertical!*1,),
                Text("Previous Bookings", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*5),),
                SizedBox(height: SizeConfig.blocksVertical!*1,),
                Expanded(
                  child: History(history: history),
                ),
              ],
            ),
          ),
        ],
      ),
  );
  }
}

class History extends StatelessWidget {
  final List<Booking> history;

  History({
    Key? key,
    required this.history,
  }) : super(key: key);

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
              // This is the fixed container
              return Container(
                margin: EdgeInsets.only(right: 20, left: 10),
                width: SizeConfig.screenWidth! * 0.88,
                height: 300,
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
                        Text("rhunnan liao",style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal! * 4,),),
                        SizedBox(width: SizeConfig.blocksHorizontal! * 30),
                        Text("150",style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal! * 4,),),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              Booking prev = history[provider.getContainerVisibility('container4') ? index - 1 : index];
              return GestureDetector(
                onTap: () {
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
                          Text(prev.client,style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal! * 4,),),
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

//add booking info and progress bar
class CurrInfo extends StatelessWidget {
  List<Booking> curr;
  CurrInfo({super.key,
  required this.curr});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Container(
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
              
            ],
          ),
        )
      ],
      );
  }
}

class PendingBooking extends StatelessWidget {
  const PendingBooking({super.key});

  @override
  Widget build(BuildContext context) {
    final visibilityProvider = Provider.of<VisibilityProvider>(context);
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
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

              SizedBox(height: SizeConfig.blocksVertical!*4,),
              visibilityProvider.getContainerVisibility('container2')
              ?Container(
              padding: const EdgeInsets.only(left:30),
                width: SizeConfig.screenWidth!*0.9,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(image: AssetImage('assets/Video-Editing.jpg'),fit: BoxFit.cover),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Video Editing", style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*6)),
                    Row(
                      children: [
                        Text("rhunnan liao", style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4),),
                        SizedBox(width: SizeConfig.blocksHorizontal!*25,),
                        Text("150", style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4),),
                        SizedBox(width: SizeConfig.blocksHorizontal!*2,),
                        IconButton(
                          onPressed: (){
                            visibilityProvider.toggleContainerVisibility('container1');
                            visibilityProvider.toggleContainerVisibility('container2');
                          },
                          icon: const Icon(Icons.check_circle, size: 20.0,color: mWhite,)),
                        IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.cancel, size: 20.0,color: mWhite,)),
                      ],
                    ),
                  ],
                ),
            )
            : Container(),
            SizedBox(height: SizeConfig.blocksVertical!*3,),
             visibilityProvider.getContainerVisibility('container3')
             ?Container(
              padding: const EdgeInsets.only(left:30),
                width: SizeConfig.screenWidth!*0.9,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(image: AssetImage('assets/logo-designing.jpg'),fit: BoxFit.cover),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Logo Design", style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*6)),
                    Row(
                      children: [
                        Text("Zeirah Gerat", style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4),),
                        SizedBox(width: SizeConfig.blocksHorizontal!*25,),
                        Text("200", style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4),),
                        SizedBox(width: SizeConfig.blocksHorizontal!*2,),
                        IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.check_circle, size: 20.0,color: mWhite,)),
                        IconButton(
                          onPressed: (){
                            visibilityProvider.toggleContainerVisibility('container3');
                          },
                          icon: const Icon(Icons.cancel, size: 20.0,color: mWhite,)),
                      ],
                    ),
                  ],
                ),
            )
            : Container(),
            ],
          ),
        ),
            ],
          ),
        );
  }
}