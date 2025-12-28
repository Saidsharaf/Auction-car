import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mazad/core/constants/app_colors.dart';

class CustomTextBtn extends StatelessWidget {
  final Color? color;
  final Color? decorationColor;
  final String text;
  final double size;
  final void Function()? onPressed;
  final TextDecoration? textDecoration;
  const CustomTextBtn(
      {super.key,
      required this.text,
      this.color,
      this.decorationColor,
      required this.size,
      this.textDecoration,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          fontSize: size,
          decoration: textDecoration,
          decorationColor: decorationColor,
          color: color ?? AppColors.primary,
        ),
      ),
    );
  }
}
