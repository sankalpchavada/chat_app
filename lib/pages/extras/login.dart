// import 'package:firebase_miner/pages/register.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../auth/auth_services.dart';
// import 'home.dart';
//
// class LogIn extends StatefulWidget {
//   const LogIn({super.key});
//
//   @override
//   State<LogIn> createState() => _LogInState();
// }
//
// class _LogInState extends State<LogIn> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passController = TextEditingController();
//
//   TextStyle lexend =
//       GoogleFonts.lexend(textStyle: TextStyle(color: Colors.blueGrey.shade100));
//
//   void LogInMethod(BuildContext context) async {
//     final authService = AuthService();
//
//     try {
//       await authService.signInWithEmailAndPassword(
//           emailController.text, passController.text);
//
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => HomePage()));
//     } catch (e) {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text(
//             e.toString(),
//             style: lexend,
//           ),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: Center(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(height: 60),
//               Image.asset('assets/icon/app_icon.png', width: 120),
//               SizedBox(height: 30),
//               Text('Hey Chat!', style: GoogleFonts.lexend(fontSize: 36)),
//               const SizedBox(height: 20),
//               Text('Welcome Back, you\'ve been missed',
//                   style: GoogleFonts.lato(fontSize: 18, color: Colors.grey)),
//               const SizedBox(height: 40),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   children: [
//                     TextField(
//                       controller: emailController,
//                       decoration: InputDecoration(
//                         hintText: 'Email',
//                         filled: true,
//                         fillColor: Colors.grey.shade200,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     TextField(
//                       controller: passController,
//                       decoration: InputDecoration(
//                         hintText: 'Password',
//                         filled: true,
//                         fillColor: Colors.grey.shade200,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                       obscureText: true,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 40),
//               ElevatedButton(
//                 onPressed: () => LogInMethod(context),
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 40,
//                     vertical: 12,
//                   ),
//                 ),
//                 child: Text(
//                   'Log in',
//                   style: GoogleFonts.lexend(fontSize: 18),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Not a member? ',
//                     style: lexend,
//                   ),
//                   GestureDetector(
//                     onTap: () => Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => RegisterPage(),
//                       ),
//                     ),
//                     child: Text('Register now',
//                         style: GoogleFonts.lexend(
//                             textStyle: TextStyle(color: Colors.blue))),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 60),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
