import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabang_application/utils/app_style.dart';
import 'package:tabang_application/utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _screenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: ListView(
        children: [
        SizedBox(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: ListView(
          scrollDirection: Axis.vertical,
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
                        hintText: "Search...",
                        prefixIcon: IconButton(
                          icon: SvgPicture.asset("assets/search.svg"),
                          onPressed: (){

                          },
                          ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  IconButton(
                    onPressed: (){

                    },
                     icon: SvgPicture.asset("assets/question.svg"))
                ]),
            ),
            const SizedBox(height: 30),
            Container(
              
            ),

            const SizedBox(height: 30),
            Text("Categories", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*5),),
            Row(
              children: [
                Container(
                  
                ),
              ],
            )
          ],
        ),
      ),
        ],
      ),
    );
  }
}


class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}