import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/src/config/routes/app_pages.dart';
import 'package:movie_app/src/config/routes/routes.dart';
import 'package:movie_app/src/mvc/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.routes,
      initialRoute: Routes.home,
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
