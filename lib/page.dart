// import 'package:flutter/material.dart';
//
// class RegistrationScreen extends StatelessWidget {
//   const RegistrationScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.red, Colors.purple],
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Logo
//               const Icon(
//                 Icons.widgets,
//                 size: 80,
//                 color: Colors.greenAccent,
//               ),
//               const SizedBox(height: 20),
//
//               // Registration Text
//               const Text(
//                 'Registration',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 30),
//
//               // Text Fields
//               _buildTextField("First Name"),
//               const SizedBox(height: 15),
//               _buildTextField("Last Name"),
//               const SizedBox(height: 15),
//               _buildTextField("Email"),
//               const SizedBox(height: 15),
//               _buildTextField("Password", isPassword: true),
//               const SizedBox(height: 30),
//
//               // Sign-Up Button
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 60),
//                   backgroundColor: Colors.pink,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   elevation: 5,
//                 ),
//                 onPressed: () {
//                   // Handle Sign-Up
//                 },
//                 child: const Text(
//                   'Sign-Up',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Login Link
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'New User?',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       // Navigate to Login Screen
//                     },
//                     child: const Text(
//                       'Login Now',
//                       style: TextStyle(
//                         color: Colors.blueAccent,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build a text field
//   Widget _buildTextField(String hintText, {bool isPassword = false}) {
//     return TextField(
//       obscureText: isPassword,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white.withOpacity(0.2),
//         hintText: hintText,
//         hintStyle: const TextStyle(color: Colors.white),
//         contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide.none,
//         ),
//       ),
//       style: const TextStyle(color: Colors.white),
//     );
//   }
// }
