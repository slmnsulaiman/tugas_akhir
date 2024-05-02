import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_project_akhir/pages/login.dart';

class SplashCreen extends StatefulWidget {
  @override
  State<SplashCreen> createState() => _SplashCreenState();
}

class _SplashCreenState extends State<SplashCreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Get.to(LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 180),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 100,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/logob.png'),
                )),
              ),
              Text(
                'Hello Fallas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('Temukan segela jenis bunga\nndari berbagai belahan dunia')
            ],
          ),
        ),
      ),
    );
  }
}
