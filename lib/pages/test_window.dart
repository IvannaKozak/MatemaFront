import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TestWindow extends StatefulWidget {
  final String username;

  TestWindow({Key? key, required this.username}) : super(key: key);

  @override
  _TestWindowState createState() => _TestWindowState();
}

class _TestWindowState extends State<TestWindow> {
  String taskText = '';
  
  String taskTheme = '';
  String taskPoint = '';
  String imageUrl = '';
  String taskName = '';
  TextEditingController answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadTask();
  }

  Future<void> loadTask() async {
    try {
      var url =
          Uri.parse('https://matema-dev-ncrzmugb6q-lm.a.run.app/user/task/9/');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(utf8.decode(response.bodyBytes));

        setState(() {
          taskName = data['name'] ?? '';
          taskTheme = data['theme'] ?? '';
          taskPoint = (data['point'] ?? '').toString();
          taskText = data['text'] ?? '';
          imageUrl = data['photo'] ?? '';
        });
      } else {
        print('Failed to load task');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> answerUser() async {
    if (answerController.text.isEmpty) {
      showAlertDialog('Помилка', 'Будь ласка, заповніть поле відповіді');
      return;
    }

    try {
      var url = Uri.parse(
          'https://matema-dev-ncrzmugb6q-lm.a.run.app/task/done/test_ivanka/');

      var response = await http.post(
        url,
        body: json.encode({
          'name': taskName,
          'user_answer': answerController.text,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuccessScreen()),
      );*/
      } else if (response.statusCode == 500) {
        showAlertDialog('Проблеми з сервером', 'Звяжіться з нами');
      } else if (response.statusCode == 400) {
        /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BadScreen()),
      );*/
      } else {
        // Handle response errors
        showAlertDialog('Помилка', 'Не вдалося надіслати відповідь');
      }
    } catch (e) {
      showAlertDialog('Помилка', e.toString());
    }
  }

  void showAlertDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: AppDimensions.m),
                          width: 200,
                          height: 80,
                          padding: const EdgeInsets.only(
                              right: 10, top: 16.0, bottom: 16.0, left: 5.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 250, 250, 249),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.zero,
                              bottomLeft: Radius.zero,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                taskName,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                taskTheme,
                                textAlign:
                                    TextAlign.start, 
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: AppDimensions.m),
                          width: 80,
                          height: 80,
                          padding: const EdgeInsets.only(
                              left: 16, top: 20.0, bottom: 10.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 250, 250, 249),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              topRight: Radius.zero,
                              bottomRight: Radius.zero,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text(
                                  '+${taskPoint}', 
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Container(
                width: 370,
                height: 375,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(11),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/matem.png', fit: BoxFit.cover),
                      /*imageUrl.isNotEmpty
                          ? Image.network(imageUrl, fit: BoxFit.cover)
                          : SizedBox(), */ // Показати пустий контейнер, якщо URL недоступний

                      SizedBox(height: 10), 
                      Text(
                        taskText,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Твоя відповідь:',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(right: AppDimensions.m),
                child: Column(
                  children: [
                    Container(
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
                        controller: answerController,
                        decoration: InputDecoration(
                          hintText: '173',
                          filled: true,
                          fillColor: AppColors.white,
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              bottomLeft: Radius.zero,
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.xxxxs),
              Container(
                margin: const EdgeInsets.only(left: AppDimensions.m),
                width: 370,
                height: 80,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: answerUser,
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 125, 86, 165),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
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
                    'Відповісти',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TestWindow(username: 'test_ivanka'),
  ));
}
