// import 'package:flutter/material.dart';
//
//
//
// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           CustomPaint(
//             size: Size(double.infinity, 200),
//             painter: WavePainter(),
//           ),
//           Center(
//             child: Text(
//               'Login',
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black54,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class WavePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..shader = LinearGradient(
//         colors: [Colors.orangeAccent, Colors.deepOrangeAccent],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
//       ..style = PaintingStyle.fill;
//
//     final path = Path();
//     path.lineTo(0, size.height * 0.75);
//     path.quadraticBezierTo(
//       size.width * 0.25, size.height,
//       size.width * 0.5, size.height * 0.85,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.75, size.height * 0.7,
//       size.width, size.height * 0.85,
//     );
//     path.lineTo(size.width, 0);
//     path.close();
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
