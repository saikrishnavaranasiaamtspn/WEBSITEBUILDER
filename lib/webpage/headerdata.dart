import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Headrerdata {
  static int numbofelements = 5;

  // static List<String> headeritems = List.filled(numbofelements, '');

  static List<String> headeritemslist() {
    List<String> headeritems = List.filled(numbofelements, '');

    headeritems[0] = 'Home';
    headeritems[1] = 'Careers';
    headeritems[2] = 'About Us';
    headeritems[3] = 'Team';
    // headeritems[4]  = 'Login';

    return headeritems;
  }

  static String headerlogo = 'assets/images/Header Logos/aamtspnlogo.png';

  static String headermenuicon =
      'assets/images/Header Logos/headermenuicon.png';

  static String fontfamilyforheaderdata = '';

  static Color headertextcolor = Colors.black;

  static Color dividertextcolor = Colors.red;


  static TextStyle josefinSanssty(FontWeight b, double c) {
    return GoogleFonts.getFont('Josefin Sans',
        textStyle: TextStyle(
          color: headertextcolor,
          fontSize: c,
          fontWeight: b,
        ));
  }
}
