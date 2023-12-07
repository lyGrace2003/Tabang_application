import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color mWhite = Color(0xffffffff);
const Color mLightWhite = Color(0xffeff5f4);
const Color mLighterWhite = Color(0xfffcfcfc);

const Color mGrey = Color(0xff9397a0);
const Color kLightGrey = Color(0xffa7a7a7);

const Color mOrange = Color.fromRGBO(255, 153, 80, 1);
const Color mBrightOrange = Color.fromRGBO(255, 153, 0, 1);
const Color mYellow = Color.fromRGBO(255, 179, 57, 1);

const double mBorderRadius = 16.0;


final mBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(mBorderRadius),
  borderSide: BorderSide.none,
);

final mExtraBold = GoogleFonts.montserrat(
  color: Colors.black,
  fontWeight: FontWeight.w800,
);

final mBold = GoogleFonts.montserrat(
  color: Colors.black,
  fontWeight: FontWeight.w700,
);

final mSemibold = GoogleFonts.montserrat(
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

final mMedium = GoogleFonts.montserrat(
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

final mRegular = GoogleFonts.montserrat(
  color: Colors.black,
  fontWeight: FontWeight.w400,
);
