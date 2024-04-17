import 'package:firebase_miner/components/btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../services/auth/auth_services.dart';
import 'home.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController cpassController = TextEditingController();

  String emailError = '';
  String passwordError = '';

  void RegisterMethod(BuildContext context) async {
    final auth = AuthService();

    // Clear previous error messages
    setState(() {
      emailError = '';
      passwordError = '';
    });

    if (cpassController.text == passController.text) {
      String email = emailController.text.trim();
      String password = passController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        setState(() {
          emailError = 'Please fill in all fields';
        });
        return;
      }

      if (!email.contains('@') || !email.contains('.')) {
        setState(() {
          emailError = 'Please enter a valid email address';
        });
        return;
      }

      if (password.length < 6) {
        setState(() {
          passwordError = 'Password must be at least 6 characters long';
        });
        return;
      }

      try {
        await auth.signUpWithEmailAndPassword(email, password);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {
        // Handle registration error
      }
    } else {
      setState(() {
        passwordError = 'Password does not match';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Container(
                  height: 120,
                  width: 120,
                  color: Colors.red,
                  child: Center(
                      child: Lottie.asset(
                    "assets/icon/chat_icon2.json",
                    fit: BoxFit.cover,
                  ))),
              const SizedBox(height: 10),
              Text('Hey Chat!', style: GoogleFonts.lexend(fontSize: 36)),
              const SizedBox(height: 20),
              Text('Create an account to start chatting',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  )),
              SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                          errorText: emailError,
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      TextField(
                        controller: passController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                          errorText: passwordError,
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        obscureText: true,
                      ),
                      TextField(
                        controller: cpassController,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Btn(btnName: "Register", onTap: () => RegisterMethod(context)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: GoogleFonts.lexend(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogIn(),
                      ),
                    ),
                    child: Text(
                      'Log in',
                      style: GoogleFonts.lexend(
                          textStyle: TextStyle(color: Color(0xff00DDB3))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
