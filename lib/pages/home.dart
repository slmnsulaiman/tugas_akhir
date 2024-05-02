import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tugas_project_akhir/controller/homecontroller.dart';
import 'package:tugas_project_akhir/model/usermodel.dart';

class HomePage extends StatelessWidget {
  final Users users;
  final HomeController _homeController = Get.put(HomeController());

  HomePage({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,  ${users.name}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text('How s your day going?')
                  ],
                ),
                Obx(() => _homeController.imagePath.value.isNotEmpty
                    ? ClipOval(
                        child: Image.file(
                        File(_homeController.imagePath.value),
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ))
                    : SizedBox.shrink())
              ],
            ),
            Divider(height: 20),
            Text('My Phone Number : ${users.phoneNumber} '),
            Text('My Address : ${users.address}'),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  _homeController.uploadPhoto();
                },
                child: Text('Upload Foto'))
          ],
        ),
      ),
    );
  }
}
