// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:matemafront/utils/app_colors.dart';

// class ResultPage extends StatefulWidget {
//   const ResultPage({super.key});

//   @override
//   State<ResultPage> createState() => _ResultPageState();
// }

// class _ResultPageState extends State<ResultPage> {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.white,
//     ));

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Результат', style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             // Handle back action
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add, color: Colors.black),
//             onPressed: () {
//               // Handle add action
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           const Spacer(),
//           Center(
//             child: Container(
//               width: 290,
//               height: 290,
//               decoration: const BoxDecoration(
//                 color: AppColors.appPurple,
//                 shape: BoxShape.circle,
//               ),
//               child: const Center(
//                 child: Text(
//                   '+5',
//                   style: TextStyle(
//                     fontSize: 150,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             'Правильно!',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const Spacer(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: ElevatedButton(
//               onPressed: () {
//                 // Handle statistics action
//               },
//               child: const Text('Подивитися статистику'),
//             ),
//           ),
//           const SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: ElevatedButton(
//               onPressed: () {
//                 // Handle main action
//               },
//               child: const Text('На головну'),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.purple,
//               ),
//             ),
//           ),
//           const SizedBox(height: 32),
//         ],
//       ),
//     );
//   }
// }
