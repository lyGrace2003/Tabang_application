import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabang_application/app_style.dart';
import 'package:tabang_application/size_config.dart';

class ScreensProvider extends StatefulWidget {
  const ScreensProvider({super.key});

  @override
  State<ScreensProvider> createState() => _ScreensProviderState();
}

class _ScreensProviderState extends State<ScreensProvider> {

  int _index = 0;
  final screens =[
    const BookingScreenProvider(),
    const UserScreenProvider(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body:screens[_index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:_index ,
          onTap: (value){
            setState(() {
              _index = value;
            });
          },
          backgroundColor: mWhite,
          items:<BottomNavigationBarItem>[
            BottomNavigationBarItem(
            icon: _index  == 0
                  ? SvgPicture.asset('assets/bookings_selected.svg')
                  : SvgPicture.asset('assets/bookings_unselected.svg'),
              label: '',
            ),
            BottomNavigationBarItem(
            icon: _index  == 2
                  ? SvgPicture.asset('assets/user_selected.svg')
                  : SvgPicture.asset('assets/user_unselected.svg'),
              label: '',
            ),
          ],
        ),
      );
  }
}

class BookingScreenProvider extends StatefulWidget {
  const BookingScreenProvider({super.key});

  @override
  State<BookingScreenProvider> createState() => _BookingScreenProviderState();
}

class _BookingScreenProviderState extends State<BookingScreenProvider> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(color: mWhite),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Current Booking", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*5),)
          ],
        ),
      ),
    );
  }
}


class UserScreenProvider extends StatefulWidget {
  const UserScreenProvider({super.key});

  @override
  State<UserScreenProvider> createState() => _UserScreenProviderState();
}

class _UserScreenProviderState extends State<UserScreenProvider> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}