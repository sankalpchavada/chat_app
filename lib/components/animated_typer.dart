import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 20.0),
        child: Row(
          children: [
            AnimatedTextKit(
              repeatForever: false,
              animatedTexts: [
                TyperAnimatedText(text,
                    curve: Curves.easeInOutBack,
                    speed: const Duration(
                      milliseconds: 100,
                    ),
                    textStyle: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, fontSize: 22)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
