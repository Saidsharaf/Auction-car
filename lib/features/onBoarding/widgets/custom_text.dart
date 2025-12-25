import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight? fontWeight;
  final Color? color;
  const CustomText({super.key, required this.text, required this.size, this.fontWeight,this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      textDirection: TextDirection.rtl,
          text,
      style: GoogleFonts.montserrat(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
