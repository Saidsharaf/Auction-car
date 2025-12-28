import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mazad/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final Color? bgColor;
  final void Function()? onTap;
  final FontWeight? fontWeight;


  const CustomButton(
      {super.key,
      required this.text,
      required this.size,
      this.fontWeight,
      this.onTap,
      this.color,
      this.bgColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              fontSize: size,
              fontWeight: fontWeight,
              color: color ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
