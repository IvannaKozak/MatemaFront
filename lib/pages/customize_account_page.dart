import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';

class MyCustomAcc extends StatefulWidget {
  @override
  _MyCustomAccState createState() => _MyCustomAccState();
}

class _MyCustomAccState extends State<MyCustomAcc> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final String baseUrl = 'https://matema-dev-ncrzmugb6q-lm.a.run.app';

  Future<void> _getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _changeProfilePicture() async {
    if (_image != null) {
      try {
        var request = http.MultipartRequest(
          'POST',
          Uri.parse('$baseUrl/user/photo/'),
        );

        request.files.add(await http.MultipartFile.fromPath(
          'file',
          _image!.path,
        ));

        var response = await request.send();
        if (response.statusCode == 200) {
          // Profile picture changed successfully
          // You may update UI or show a success message here
        } else {
          // Handle error
        }
      } catch (e) {
        // Handle exception
      }
    }
  }

  Future<void> _updateUserName() async {
    final String newUsername = _nameController.text;
    final String currentPassword = _passwordController.text;

    try {
      var response = await http.post(
        Uri.parse('$baseUrl/auth/users/set_username/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'current_password': currentPassword,
          'new_username': newUsername,
        }),
      );

      if (response.statusCode == 200) {
        // Username updated successfully
        // You may update UI or show a success message here
      } else {
        // Handle error
      }
    } catch (e) {
      // Handle exception
    }
  }

  Future<void> _updatePassword() async {
    final String newPassword = _passwordController.text;
    final String currentPassword = _passwordController.text;

    try {
      var response = await http.post(
        Uri.parse('$baseUrl/auth/users/set_password/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'new_password': newPassword,
          're_new_password':
              newPassword, // Assuming re-entering the same password
          'current_password': currentPassword,
        }),
      );

      if (response.statusCode == 200) {
        // Password updated successfully
        // You may update UI or show a success message here
      } else {
        // Handle error
      }
    } catch (e) {
      // Handle exception
    }
  }

  Future<void> _saveChanges() async {
    await _changeProfilePicture();
    // await _updateUserName();
    // await _updatePassword();
    // After all changes, perform further actions if needed
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.verylightBackground,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: AppDimensions.t,
        leading: Container(
          height: 65,
          width: 60,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/images/back_arrow.svg',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 0.05 * MediaQuery.of(context).size.height),
              GestureDetector(
                onTap: _getImage,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.appPurple,
                            width: 3,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: AppColors.appGreen,
                          radius: 100,
                          backgroundImage:
                              _image != null ? FileImage(_image!) : null,
                          child: _image == null ? const Text('Add PFP') : null,
                        ),
                      ),
                      const SizedBox(height: 9),
                      const Text(
                        'Я',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'ID: Моє',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                child: Align(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.all(10.0),
                        child: const Text(
                          'Змінити Ім`я і Прізвище:',
                          style: AppFonts.semiboldDark24,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        margin: const EdgeInsets.only(right: AppDimensions.s),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: 'Ім`я і Прізвище',
                            hintStyle: AppFonts.semiboldDark24_,
                            filled: true,
                            fillColor: AppColors.white,
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.zero,
                                bottomLeft: Radius.zero,
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.all(10.0),
                        child: const Text(
                          'Поміняти Пароль:',
                          style: AppFonts.semiboldDark24,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: AppDimensions.s),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Пароль',
                            hintStyle: AppFonts.semiboldDark24_,
                            filled: true,
                            fillColor: AppColors.white,
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.zero,
                                bottomLeft: Radius.zero,
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: _saveChanges,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.appPurple,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 80,
                                vertical: 17,
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  topRight: Radius.zero,
                                  bottomRight: Radius.zero,
                                ),
                              ),
                            ),
                            child: const Text(
                              'Зберегти зміни',
                              style: AppFonts.boldWhite26,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
