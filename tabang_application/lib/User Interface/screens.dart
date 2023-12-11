import 'package:flutter/material.dart';
import 'package:tabang_application/User%20Interface/bookings_screen.dart';
import 'package:tabang_application/User%20Interface/favorite_screen.dart';
import 'package:tabang_application/User%20Interface/home_screen.dart';
import 'package:tabang_application/User%20Interface/user_profile_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabang_application/utils/app_style.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {

  int _index = 0;
  final screens =[
    const HomeScreen(),
    const BookingsScreen(),
    const FavoriteScreen(),
    const UserProfileScreen(),
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
                  ? SvgPicture.asset('assets/home_selected.svg')
                  : SvgPicture.asset('assets/home_unselected.svg'),
              label: '',
            ),
            BottomNavigationBarItem(
            icon: _index  == 1
                  ? SvgPicture.asset('assets/bookings_selected.svg')
                  : SvgPicture.asset('assets/bookings_unselected.svg'),
              label: '',
            ),
            BottomNavigationBarItem(
            icon: _index  == 2
                  ? SvgPicture.asset('assets/favorite_selected.svg')
                  : SvgPicture.asset('assets/favorite_unselected.svg'),
              label: '',
            ),
            BottomNavigationBarItem(
            icon: _index  == 3
                  ? SvgPicture.asset('assets/user_selected.svg')
                  : SvgPicture.asset('assets/user_unselected.svg'),
              label: '',
            ),
          ],
        ),
      );
  }
}