import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthlyBudgetForm extends StatefulWidget {
  @override
  _MonthlyBudgetFormState createState() => _MonthlyBudgetFormState();
}

class _MonthlyBudgetFormState extends State<MonthlyBudgetForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _monthlyAmountController = TextEditingController();
  final TextEditingController _extraAmountController = TextEditingController();

  final List<String> _weekDays = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
  ];
  final List<String> _routines = ['Lunch', 'Dinner'];

  String? _selectedDay;
  String? _selectedRoutine;

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      print("Monthly Amount: ${_monthlyAmountController.text}");
      print("Extra Amount: ${_extraAmountController.text}");
      print("Selected Day: $_selectedDay");
      print("Selected Routine: $_selectedRoutine");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 12),
              Text('Budget Successfully Updated!'),
            ],
          ),
          backgroundColor: Color(0xFF6C63FF),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFF5F7FF),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Budget Planner',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF6C63FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body: Stack(
        children: [
          CustomPaint(
            size: Size(screenWidth, screenHeight * 0.3),
            painter: ModernWavePainter(),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                children: [
                  _buildHeaderCard(screenWidth),
                  SizedBox(height: 24),
                  _buildFormCard(screenWidth, screenHeight),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderCard(double screenWidth) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.account_balance_wallet, size: 40, color: Color(0xFF6C63FF)),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Monthly Budget',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3142),
                  ),
                ),
                Text(
                  'Plan your expenses wisely',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Color(0xFF9094A6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormCard(double screenWidth, double screenHeight) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(
              controller: _monthlyAmountController,
              labelText: 'Monthly Budget',
              hintText: 'Enter amount',
              icon: Icons.attach_money,
            ),
            SizedBox(height: 20),
            _buildTextField(
              controller: _extraAmountController,
              labelText: 'Extra Budget',
              hintText: 'Enter extra amount',
              icon: Icons.add_circle_outline,
            ),
            SizedBox(height: 20),
            _buildDropdown(
              value: _selectedDay,
              items: _weekDays,
              labelText: 'Preferred Day',
              icon: Icons.calendar_today,
              onChanged: (value) => setState(() => _selectedDay = value),
            ),
            SizedBox(height: 20),
            _buildDropdown(
              value: _selectedRoutine,
              items: _routines,
              labelText: 'Meal Time',
              icon: Icons.restaurant_menu,
              onChanged: (value) => setState(() => _selectedRoutine = value),
            ),
            SizedBox(height: 32),
            _buildSubmitButton(screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2D3142),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: GoogleFonts.poppins(),
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon, color: Color(0xFF6C63FF)),
            filled: true,
            fillColor: Color(0xFFF5F7FF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFF6C63FF)),
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) return 'This field is required';
            if (double.tryParse(value!) == null) return 'Please enter a valid amount';
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required String labelText,
    required IconData icon,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2D3142),
          ),
        ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item, style: GoogleFonts.poppins()),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Color(0xFF6C63FF)),
            filled: true,
            fillColor: Color(0xFFF5F7FF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFF6C63FF)),
            ),
          ),
          validator: (value) => value == null ? 'Please make a selection' : null,
        ),
      ],
    );
  }

  Widget _buildSubmitButton(double screenWidth) {
    return Container(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _submitForm,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF6C63FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Text(
          'Save Budget',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ModernWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xFF6C63FF).withOpacity(0.1)
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.7)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.9,
        size.width * 0.5,
        size.height * 0.7,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.5,
        size.width,
        size.height * 0.7,
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}