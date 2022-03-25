import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/src/config/routes/app_pages.dart';
import 'package:movie_app/src/config/routes/routes.dart';
import 'package:movie_app/src/mvc/views/home.dart';
import 'package:movie_app/src/style/style.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.home,
      title: 'Movie App',
      theme: ThemeData(
          scaffoldBackgroundColor: AppStyles.scaffoldBackgroundColor,
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.poppins().fontFamily),
      home: const Home(),
    );
  }
}
