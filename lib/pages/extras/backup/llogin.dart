// import 'package:firebase_miner/components/auth_textfield.dart';
// import 'package:firebase_miner/components/btn.dart';
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
//
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
//           context: context,
//           builder: (context) => AlertDialog(
//                   title: Text(
//                 e.toString(),
//                 style: lexend,
//               )));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Icon(
//                 Icons.message_outlined,
//                 size: 70,
//                 color: Colors.blue,
//               ),
//               Text(
//                 "Hey Chat!",
//                 style: GoogleFonts.lexend(
//                     textStyle: TextStyle(fontSize: 40, color: Colors.black54)),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Text("Welcome Back, you've been missed",
//               style: GoogleFonts.lato(
//                 textStyle: TextStyle(color: Colors.grey, fontSize: 16),
//               )),
//           const SizedBox(
//             height: 25,
//           ),
//           MyTextField(
//             hintText: "Email",
//             obscureText: false,
//             controller: emailController,
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           MyTextField(
//             hintText: "Password",
//             obscureText: true,
//             controller: passController,
//           ),
//           const SizedBox(
//             height: 25,
//           ),
//           Btn(
//             btnName: "Log in",
//             onTap: () => LogInMethod(context),
//           ),
//           const SizedBox(
//             height: 25,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Not a member? ",
//                 style: lexend,
//               ),
//               GestureDetector(
//                   onTap: () => Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => RegisterPage(),
//                       )),
//                   child: Text(
//                     "Register now",
//                     style: lexend,
//                   )),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
