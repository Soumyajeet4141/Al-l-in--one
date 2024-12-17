// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class RegistrationForm extends StatefulWidget {
//   const RegistrationForm({super.key});
//
//   @override
//   _RegistrationFormState createState() => _RegistrationFormState();
// }
//
// class _RegistrationFormState extends State<RegistrationForm> {
//   final _formKey = GlobalKey<FormState>();
//   bool _termsAccepted = false;
//   bool _passwordVisible = false;
//   bool _confirmPasswordVisible = false;
//
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//   final TextEditingController _imagePathController = TextEditingController();
//
//   final Set<String> _selectedRoles = {};
//
//   String _imagePath = '';
//   final ImagePicker _picker = ImagePicker();
//
//   void _pickImage(ImageSource source) async {
//     final pickedFile = await _picker.pickImage(source: source);
//     if (pickedFile != null) {
//       setState(() {
//         String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//         _imagePath = '$fileName.jpg';
//         _imagePathController.text = _imagePath.isEmpty ? 'No image selected' : _imagePath;
//       });
//     }
//   }
//
//   void _submitForm() {
//     if (_formKey.currentState!.validate() && _termsAccepted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Form Submitted Successfully!')),
//       );
//     } else if (!_termsAccepted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please accept terms and conditions')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('User Registration'),
//         centerTitle: true,
//         backgroundColor: Colors.deepPurpleAccent,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Colors.deepPurple, Colors.pinkAccent],
//           ),
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildTextField(_nameController, 'Name'),
//                   const SizedBox(height: 15),
//                   _buildTextField(_phoneController, 'Phone Number', inputType: TextInputType.phone),
//                   const SizedBox(height: 15),
//                   _buildTextField(_emailController, 'Email ID', inputType: TextInputType.emailAddress),
//                   const SizedBox(height: 20),
//                   GestureDetector(
//                     onTap: _showImageSourceDialog,
//                     child: _buildTextField(_imagePathController, 'Image', readOnly: true),
//                   ),
//                   const SizedBox(height: 15),
//                   _buildTextField(_usernameController, 'Username'),
//                   const SizedBox(height: 15),
//                   _buildPasswordField(_passwordController, 'Password', _passwordVisible, () {
//                     setState(() {
//                       _passwordVisible = !_passwordVisible;
//                     });
//                   }),
//                   const SizedBox(height: 15),
//                   _buildPasswordField(_confirmPasswordController, 'Confirm Password', _confirmPasswordVisible, () {
//                     setState(() {
//                       _confirmPasswordVisible = !_confirmPasswordVisible;
//                     });
//                   }),
//                   const SizedBox(height: 15),
//                   _buildRoleSelector(),
//                   const SizedBox(height: 20),
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: _termsAccepted,
//                         activeColor: Colors.deepPurpleAccent,
//                         onChanged: (value) {
//                           setState(() {
//                             _termsAccepted = value ?? false;
//                           });
//                         },
//                       ),
//                       const Expanded(
//                         child: Text(
//                           'I accept the terms and conditions',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: _submitForm,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.deepPurpleAccent,
//                         padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                       ),
//                       child: const Text('Submit', style: TextStyle(fontSize: 18)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(TextEditingController controller, String label, {bool readOnly = false, TextInputType inputType = TextInputType.text}) {
//     return TextFormField(
//       controller: controller,
//       readOnly: readOnly,
//       decoration: InputDecoration(
//         labelText: label,
//         filled: true,
//         fillColor: Colors.white.withOpacity(0.9),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//           borderSide: BorderSide.none,
//         ),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       ),
//       keyboardType: inputType,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter your $label';
//         }
//         return null;
//       },
//     );
//   }
//
//   Widget _buildPasswordField(TextEditingController controller, String label, bool obscureText, VoidCallback toggleVisibility) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         labelText: label,
//         filled: true,
//         fillColor: Colors.white.withOpacity(0.9),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//           borderSide: BorderSide.none,
//         ),
//         suffixIcon: IconButton(
//           icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
//           onPressed: toggleVisibility,
//         ),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter your $label';
//         }
//         return null;
//       },
//     );
//   }
//
//   Widget _buildRoleSelector() {
//     return Row(
//       children: [
//         const Text('Select Role:', style: TextStyle(color: Colors.black)),
//         Checkbox(
//           value: _selectedRoles.contains('User'),
//           onChanged: (value) {
//             setState(() {
//               if (value == true) {
//                 _selectedRoles.clear();
//                 _selectedRoles.add('User');
//               } else {
//                 _selectedRoles.remove('User');
//               }
//             });
//           },
//         ),
//         const Text('User', style: TextStyle(color: Colors.black)),
//         Checkbox(
//           value: _selectedRoles.contains('Emp'),
//           onChanged: (value) {
//             setState(() {
//               if (value == true) {
//                 _selectedRoles.clear();
//                 _selectedRoles.add('Emp');
//               } else {
//                 _selectedRoles.remove('Emp');
//               }
//             });
//           },
//         ),
//         const Text('Emp', style: TextStyle(color: Colors.black)),
//       ],
//     );
//   }
//
//   void _showImageSourceDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Select Image Source'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 title: const Text('Camera'),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   _pickImage(ImageSource.camera);
//                 },
//               ),
//               ListTile(
//                 title: const Text('Gallery'),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   _pickImage(ImageSource.gallery);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
// //