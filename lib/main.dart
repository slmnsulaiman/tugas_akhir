import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_project_akhir/helper/dbhelper.dart';

import 'package:tugas_project_akhir/pages/splas.dart';

void main() {
  runApp(const MyApp());
  Get.put(DataHelper());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      home: SplashCreen(),
    );
  }
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataHelper());
  }
}
