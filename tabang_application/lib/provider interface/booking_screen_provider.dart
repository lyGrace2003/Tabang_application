import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabang_application/utils/app_style.dart';
import 'package:tabang_application/utils/size_config.dart';

class BookingsProvider extends StatefulWidget {
  const BookingsProvider({super.key});

  @override
  State<BookingsProvider> createState() => _BookingsProviderState();
}

class _BookingsProviderState extends State<BookingsProvider> {
  final CollectionReference _currentCollection = FirebaseFirestore.instance.collection('currentBooking');
  final CollectionReference _historyCollection = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('history');
 
   late final User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser!;
  }

  Future<QuerySnapshot> getCurrentBooking() async {
    return await _currentCollection
        .limit(1)
        .where('providerID', isEqualTo: user!.uid)
        .get();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            decoration: const BoxDecoration(color: mWhite),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40,),
                Text("Current Booking", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*7),),
                const SizedBox(height: 25,),
      
              //obtain single document from firestore
              FutureBuilder<QuerySnapshot>(
              future:  getCurrentBooking(),
              builder: (BuildContext context, snapshot) {
                 if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Text('You have no current bookings', style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*4),);
              }else if (snapshot.hasData) {
              var doc = snapshot.data!.docs.first;
              final coverUrl = doc['coverUrl'];
              final service = doc["service"];
              final client = doc["client"];
              final price = doc["price"];
              final docID = doc.id;
      
                return Container(
                  padding: const EdgeInsets.all(30),
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(coverUrl),
                    fit: BoxFit.cover,
                  ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(service, style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*8),),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          Text(client, style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*5),),
                          const SizedBox(width: 20,),
                          Text(price, style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*5),),
                          const SizedBox(width: 20,),
                          IconButton(
                            onPressed: (){},  // get current booking info and update 
                              icon: const Icon(Icons.info_rounded, size: 30.0, color: mWhite,)
                              )
                        ],
                      )
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),  
                GestureDetector(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PendingPage()));
                  },
                  child: Container(
                    width: SizeConfig.screenWidth,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pending", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*7),),
                        const SizedBox(width: 50,),
                        const Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Text("Previous Booking", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*7),),
                
                // streambuilder of all previousbooking
                  StreamBuilder<QuerySnapshot>(
                  stream: _historyCollection.snapshots(),
                  builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                  );
                }else if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
                  return Text('You have no previous bookings', style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*4),);
                }else if(snapshot.hasData){
                  var doc  = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: doc.length,
                    itemBuilder: (context, index) {
                      return Container(
                      padding: const EdgeInsets.all(30),
                      width: 400,
                      height: 150,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(doc[index]['coverUrl']),
                        fit: BoxFit.cover,
                      ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(doc[index]['service'], style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*8),),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Text(doc[index]['client'], style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*5),),
                              const SizedBox(width: 20,),
                              Text(doc[index]['price'], style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*5),),
                              const SizedBox(width: 20,),
                              Text(doc[index]['date'], style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*5),), 
                            ],
                          )
                        ],
                      ),
                    );
                    }
                  );
                }
                return const Center(child: CircularProgressIndicator());
                  }
                  )
              ]
            )
          ),
        ],
      )
    );
  }
  }

  class PendingPage extends StatefulWidget {
  const PendingPage({super.key});

  @override
  State<PendingPage> createState() => _PendingPageState();
}

class _PendingPageState extends State<PendingPage> {
  final CollectionReference _pendingCollection = FirebaseFirestore.instance.collection('pendingBooking');
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: SvgPicture.asset("assets/orange_left_arrow.svg")),
          StreamBuilder<QuerySnapshot>(
            stream: _pendingCollection.where('providerID', isEqualTo: user.uid).snapshots(),
             builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
            );
          }else if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
            return Text('You have no pending bookings', style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*4),);
          }else if(snapshot.hasData){
            var doc  = snapshot.data!.docs;
            return ListView.builder(
              itemCount: doc.length,
              itemBuilder: (context, index) {
                return Container(
                padding: const EdgeInsets.all(30),
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(doc[index]['coverUrl']),
                  fit: BoxFit.cover,
                ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doc[index]['service'], style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*8),),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Text(doc[index]['client'], style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*5),),
                        const SizedBox(width: 20,),
                        Text(doc[index]['price'], style: mRegular.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*5),),
                        const SizedBox(width: 20,),
                        IconButton(
                          onPressed: (){},  // get current booking info and update 
                            icon: const Icon(Icons.check, size: 30.0, color: mWhite,)
                            ),
                        IconButton(
                          onPressed: (){},  // get current booking info and update 
                            icon: const Icon(Icons.cancel, size: 30.0, color: mWhite,)
                            )
                        
                      ],
                    )
                  ],
                ),
               );
              }
            );
          }
          return  const Center(child: CircularProgressIndicator());
             }
            )
          ],
        ),
      ),
    );
  }
}        

