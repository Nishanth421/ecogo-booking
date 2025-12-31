
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../gen/colors.gen.dart';


TextStyle p = GoogleFonts.getFont('Poppins' ,fontSize: 14, );
TextStyle h6 = GoogleFonts.getFont('Poppins',fontSize: 14, );
TextStyle h5 = GoogleFonts.getFont('Poppins',fontSize: 20, );
TextStyle smallDark = GoogleFonts.getFont('Poppins',fontSize: 12);
TextStyle small = GoogleFonts.getFont('Poppins',fontSize: 12, );
TextStyle placeholder = GoogleFonts.getFont('Poppins',fontSize: 16, );
TextStyle button = GoogleFonts.getFont('Poppins',fontSize: 12,color: ColorName.white,fontWeight: FontWeight.w500 );
TextStyle appBar = GoogleFonts.getFont('Poppins',fontSize: 19,fontWeight: FontWeight.w600,color: ColorName.white );
TextStyle appNameExo = GoogleFonts.getFont('Exo',fontSize: 40,fontWeight: FontWeight.w800,color: ColorName.darkPrimary);
TextStyle welcomeAppNameExo = GoogleFonts.getFont('Exo',fontSize: 20,fontWeight: FontWeight.w800,color: ColorName.black1);
TextStyle size = GoogleFonts.getFont('Poppins',fontSize: 19);
TextStyle chillerPrice = GoogleFonts.exo(fontSize: 20,fontWeight: FontWeight.w800,color: ColorName.primary);

extension TextStyleExtensions on TextStyle {
  
  TextStyle get primary => copyWith(color: ColorName.primary);
  TextStyle get darkPrimary => copyWith(color: ColorName.darkPrimary);
  TextStyle get background => copyWith(color: ColorName.background);
  TextStyle get white => copyWith(color: ColorName.white);
  TextStyle get black => copyWith(color: ColorName.black);
  TextStyle get border => copyWith(color: ColorName.border);
  TextStyle get p => copyWith(color: ColorName.p);
  TextStyle get black1 => copyWith(color: ColorName.black1);
  TextStyle get dropDownIconColor => copyWith(color: ColorName.dropdownIconColor);
  TextStyle get errorColor => copyWith(color: ColorName.errorColor);
  

  TextStyle get s10 => copyWith(fontSize: 10.0);
  TextStyle get s12 => copyWith(fontSize: 12.0);
  TextStyle get s14 => copyWith(fontSize: 14.0);
  TextStyle get s16 => copyWith(fontSize: 16.0);
  TextStyle get s18 => copyWith(fontSize: 18.0);
  TextStyle get s25 => copyWith(fontSize: 25.0);
  TextStyle get s30 => copyWith(fontSize: 30.0);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
}
