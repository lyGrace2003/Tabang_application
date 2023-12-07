import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabang_application/User%20Interface/search_page.dart';
import 'package:tabang_application/app_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        children: [
          Column(
            children: [
              Container(
                width: 900,
                height: 100, 
                decoration: const BoxDecoration(color: mOrange),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 45,
                      width: 300,
                      decoration: BoxDecoration(
                        color: mWhite,
                        borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            IconButton(onPressed: () {

                              //change this - it needs to allow users to type then search related


                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SearchPage()),
                              );
                            }, icon: SvgPicture.asset('assets/search.svg')),
                            const SizedBox(
                              width: 200,
                            ),
                            IconButton(onPressed: () {

                              //change this - it needs to allow users to clear text


                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SearchPage()),
                              );
                              }, icon: SvgPicture.asset('assets/cancel_search.svg')),
                          ],
                          ),
                    ),
                    
                ],)
              )
            ],
          ),
        ],
    );
  }
}