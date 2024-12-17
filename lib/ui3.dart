import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  XFile? _image;
  bool isUserRole = false;
  bool isEmpRole = false;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? selectedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = selectedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.teal[400],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              SizedBox(height: 20),
              _buildTextField("Name", nameController),
              SizedBox(height: 15),
              _buildTextField("Phone Number", phoneController, keyboardType: TextInputType.phone),
              SizedBox(height: 15),
              _buildTextField("Email", emailController, keyboardType: TextInputType.emailAddress),
              SizedBox(height: 15),
              _buildTextField("Username", usernameController),
              SizedBox(height: 15),
              _buildTextField("Password", passwordController, isPassword: true),
              SizedBox(height: 15),
              _buildTextField("Confirm Password", confirmPasswordController, isPassword: true),
              SizedBox(height: 15),
              _buildImagePicker(),
              SizedBox(height: 15),
              _buildRoleSelection(),
              SizedBox(height: 30),
              _buildRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          "Create an Account",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.teal[600],
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Sign up to get started!",
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text, bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.teal[700]),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.teal.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.teal.shade400),
        ),
      ),
      validator: (value) => value!.isEmpty ? 'Please enter your $label' : null,
    );
  }

  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.teal.shade200),
        ),
        child: _image == null
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.camera_alt, color: Colors.teal[300], size: 40),
              SizedBox(height: 5),
              Text("Upload Profile Picture", style: TextStyle(color: Colors.teal[400])),
            ],
          ),
        )
            : ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(File(_image!.path), fit: BoxFit.cover, width: double.infinity),
        ),
      ),
    );
  }

  Widget _buildRoleSelection() {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: isUserRole,
              onChanged: (value) {
                setState(() {
                  isUserRole = value!;
                });
              },
              activeColor: Colors.teal,
            ),
            Text('User', style: TextStyle(color: Colors.teal[800])),
            Checkbox(
              value: isEmpRole,
              onChanged: (value) {
                setState(() {
                  isEmpRole = value!;
                });
              },
              activeColor: Colors.teal,
            ),
            Text('Employee', style: TextStyle(color: Colors.teal[800])),
          ],
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Implement registration logic here
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registration successful!')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal[500],
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        'Register',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
