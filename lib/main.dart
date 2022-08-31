import 'package:flutter/material.dart';

import 'package:get/get.dart';
import './bindings/bindings.dart';
import './view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MyBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Get X Tutorial',
      home: const Home(),
    );
  }
}
