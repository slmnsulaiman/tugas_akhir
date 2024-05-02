import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_project_akhir/controller/usercontroller.dart';
import 'package:tugas_project_akhir/pages/login.dart';

class RegisterPage extends StatelessWidget {
  final UserController _userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.fromLTRB(35, 80, 35, 0),
      child: ListView(
        children: [
          Center(
            child: Text(
              'Register Your Account',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Gmail'),
              SizedBox(height: 10),
              TextField(
                controller: _userController.emailController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    hintText: 'Gmail here...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              SizedBox(height: 10),
              Text('Name'),
              SizedBox(height: 10),
              TextField(
                controller: _userController.nameController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    hintText: 'Name here...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              SizedBox(height: 10),
              Text('Address'),
              SizedBox(height: 10),
              TextField(
                controller: _userController.addressController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    hintText: 'Address here...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              SizedBox(height: 10),
              Text('Phone Number'),
              SizedBox(height: 10),
              TextField(
                controller: _userController.phoneNumberController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    hintText: 'Phone Number...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              SizedBox(height: 10),
              Text('Password'),
              SizedBox(height: 10),
              TextField(
                controller: _userController.passwordController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    hintText: 'Passwrod here...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              SizedBox(height: 10),
              Text('Confirm Password'),
              SizedBox(height: 10),
              TextField(
                controller: _userController.confirmPasswordController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    hintText: 'Confrim Password here...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              SizedBox(height: 10),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              _userController.registerUser().then((succes) {
                if (succes) {
                  Get.to(LoginPage());
                  Get.snackbar('Berhasil', 'Silahkan login');
                }
              });
            },
            child: Text(
              'REGISTER',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[200]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account ?'),
              TextButton(
                  onPressed: () {
                    Get.to(LoginPage());
                  },
                  child: Text('Login'))
            ],
          )
        ],
      ),
    ));
  }
}
