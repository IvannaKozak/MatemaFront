import 'package:flutter/material.dart';

import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_fonts.dart';

import 'package:matemafront/api/api_service_fetch_user_data.dart';

import 'package:matemafront/pages/customize_account_page.dart';
import 'package:matemafront/pages/language_change_page.dart';
import 'package:matemafront/pages/technical_support_page.dart';

import 'package:matemafront/widgets/logout_button_profile.dart';
import 'package:matemafront/widgets/profile_customization_button.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  Map<String, String> profileInfo = {};

  @override
  void initState() {
    super.initState();
    loadProfileInformation(context);
  }

  Future<void> loadProfileInformation(context) async {
    try {
      Map<String, String> info = await getProfileInformation(context);
      setState(() {
        profileInfo = info;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<Map<String, String>> getProfileInformation(
      BuildContext context) async {
    try {
      UserProfile userProfile = await fetchProfileUsernameAndFullname(context);
      String firstName = userProfile.firstName;
      String lastName = userProfile.lastName;
      String username = userProfile.username;

      Map<String, String> info = {
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
      };

      return info;
    } catch (error) {
      print('Error: $error');
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 0.05 * MediaQuery.of(context).size.height),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FutureBuilder(
                  future: fetchProfileImage(context),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.appPurple,
                          width: 4,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage:
                            snapshot.connectionState == ConnectionState.waiting
                                ? null
                                : snapshot.hasError
                                    ? null
                                    : snapshot.hasData
                                        ? NetworkImage(snapshot.data!)
                                        : null,
                        child: snapshot.hasError
                            ? Icon(
                                Icons.person_off,
                                size: 80,
                              )
                            : null,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 9),
                Text(
                  '${profileInfo['firstName']} ${profileInfo['lastName']}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${profileInfo['username']}',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 25),
                Button(
                  name: const Text(
                    'Редагування профілю',
                    style: AppFonts.semiboldDark20,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyCustomAcc()),
                    );
                  },
                  svgPath: 'assets/images/user_circle.svg',
                ),
                const SizedBox(height: 15),
                Button(
                  name: const Text(
                    'Зміна мови',
                    style: AppFonts.semiboldDark20,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LanguageChange()),
                    );
                  },
                  svgPath: 'assets/images/paper.svg',
                ),
                const SizedBox(height: 15),
                Button(
                  name: const Text(
                    'Тех. підтримка',
                    style: AppFonts.semiboldDark20,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TechSupport()),
                    );
                  },
                  svgPath: 'assets/images/info.svg',
                ),
                const SizedBox(height: 15),
                const Divider(endIndent: BorderSide.strokeAlignCenter),
                const SizedBox(height: 15),
                LogOutButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
