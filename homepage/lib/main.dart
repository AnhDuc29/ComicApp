import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/pages/homepage.dart';
import 'package:homepage/pages/uiPage.dart';
import 'package:homepage/util/comic_ui_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      )
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: ComicUIColors.background,
        textTheme: GoogleFonts.sourceSansProTextTheme(),
      ),
      home: HomePage(),
    );
  }
}
