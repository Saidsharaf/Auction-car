import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mazad/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight? fontWeight;
  const CustomButton({super.key, required this.text, required this.size, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: size,
            fontWeight: fontWeight,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
