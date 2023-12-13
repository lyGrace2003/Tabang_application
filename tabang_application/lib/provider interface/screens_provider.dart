import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabang_application/provider%20interface/booking_screen_provider.dart';
import 'package:tabang_application/provider%20interface/provider_profile.dart';
import 'package:tabang_application/utils/app_style.dart';

class ScreensProvider extends StatefulWidget {
  const ScreensProvider({super.key});

  @override
  State<ScreensProvider> createState() => _ScreensProviderState();
}

class _ScreensProviderState extends State<ScreensProvider> {

  int _index = 0;
  final screens =[
    const BookingsProvider(),
    const ProvderProfile(),
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