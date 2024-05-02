import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_project_akhir/controller/usercontroller.dart';
import 'package:tugas_project_akhir/pages/home.dart';

import 'package:tugas_project_akhir/pages/register.dart';

class LoginPage extends StatelessWidget {
  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              width: 200,
              height: 330,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('assets/logolo.png'))),
            ),
            Center(
              child: Text(
                'Welcome To Azalea',
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 35, right: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Username'),
                  SizedBox(height: 10),
                  TextField(
                    controller: _userController.emailController,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        hintText: 'Username here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(height: 15),
                  Text('Password'),
                  SizedBox(height: 10),
                  TextField(
                    controller: _userController.passwordController,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        hintText: 'Password here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 35, left: 35),
              child: ElevatedButton(
                onPressed: () {
                  String email = _userController.emailController.text.trim();
                  String password =
                      _userController.passwordController.text.trim();

                  _userController.login(email, password).then((users) {
                    if (users != null) {
                      Get.to(HomePage(key: key, users: users));
                    }
                  });
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[200]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don’t have an account ?'),
                TextButton(
                    onPressed: () {
                      Get.to(RegisterPage());
                    },
                    child: Text('Register'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
