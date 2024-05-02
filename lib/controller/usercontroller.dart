import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/usermodel.dart';
import '../helper/dbhelper.dart';

class UserController extends GetxController {
  final DataHelper dbHelper = Get.find();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<bool> registerUser() async {
    final name = nameController.text;
    final email = emailController.text;
    final address = addressController.text;
    final phoneNumber = phoneNumberController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty ||
        email.isEmpty ||
        address.isEmpty ||
        phoneNumber.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Error', 'Please enter a valid email address');
      return false;
    }

    if (password != confirmPassword) {
      Get.snackbar('Error', 'Password and confirm password do not match');
      return false;
    }

    final users = Users(
      name: name,
      email: email,
      address: address,
      phoneNumber: phoneNumber,
      password: password,
      id: null,
    );

    await dbHelper.insertUsers(users);
    return true;
  }

  Future<Users?> login(String email, String password) async {
    final users = await dbHelper.getUsersByEmail(email);
    if (users != null && users.password == password) {
      Get.snackbar('Sukses', 'Login Berhasil');
      return users;
    } else {
      Get.snackbar('gagal', 'silahkan isi yang benar');
      return null;
    }
  }

  @override
  void dispose() {
    // Dispose all controllers when this controller is disposed
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
