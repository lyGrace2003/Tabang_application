import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabang_application/app_style.dart';
import 'package:tabang_application/login/signup/register_client.dart';
import 'package:tabang_application/login/signup/register_provider.dart';
import 'package:tabang_application/size_config.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(
         color: mWhite
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            Row(
            children:[IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: SvgPicture.asset("assets/orange_left_arrow.svg")),
            ],
            ),
            const SizedBox(height: 50,),
            Text("Sign Up", style: mRegular.copyWith(color: mOrange,fontSize: SizeConfig.blocksHorizontal!*12, letterSpacing: 2),),
            const SizedBox(height: 10,),
            SizedBox(
              width: 300,
              height: 300,
              child: SvgPicture.asset("assets/signup_image.svg"),
              ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: buttonOutlinedOrange,
                    onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const RegisterClient(),
                            ),
                          );
                        }, child: Text("User", style: mRegular.copyWith(color: mOrange, fontSize: SizeConfig.blocksHorizontal!*6),)),
                  const SizedBox(height: 40,),
                  ElevatedButton(
                    style: buttonOrange,
                    onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const RegisterProvider(),
                            ),
                          );
                        }, child: Text("Provider",style: mRegular.copyWith(color: mWhite,fontSize: SizeConfig.blocksHorizontal!*6),)),
                ],
              ),
          ],
      ),
      ),
    );
  }
}

