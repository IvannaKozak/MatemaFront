import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MyCustomAcc extends StatefulWidget {
  @override
  _MyCustomAccState createState() => _MyCustomAccState();
}

class _MyCustomAccState extends State<MyCustomAcc> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  File? _image;

  void _saveChanges() {
    final String newName = _nameController.text;
    final String newPassword = _passwordController.text;

    print('New Name: $newName');
    print('New Password: $newPassword');
  }

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
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
          decoration: BoxDecoration(
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
                onTap: () {
                  _getImage();
                },
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
                          child: _image == null ? Text('Add PFP') : null,
                        ),
                      ),
                      SizedBox(height: 9),
                      Text(
                        'Я',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ID: Моє',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                child: Align(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.all(10.0),
                        child: const Text(
                          'Змінити Ім`я і Прізвище:',
                          style: AppFonts.semiboldDark24,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        margin: const EdgeInsets.only(right: AppDimensions.s),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0, 4),
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
                      SizedBox(height: 35),
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.all(10.0),
                        child: const Text(
                          'Поміняти Пароль:',
                          style: AppFonts.semiboldDark24,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: AppDimensions.s),
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
                      SizedBox(height: 35),
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
                            child: Text(
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
