import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mazad/core/constants/app_colors.dart';

class CustomUnfilledButton extends StatelessWidget {
  final String text;
  final double size;
  final void Function()? onTap;
  final FontWeight? fontWeight;
  const CustomUnfilledButton({super.key, required this.text, required this.size, this.fontWeight, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              fontSize: size,
              fontWeight: fontWeight,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
