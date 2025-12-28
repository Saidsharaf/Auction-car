import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomSocialMedia extends StatelessWidget {
  final String imagePath;
  const CustomSocialMedia({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 83.3,
          height: 43,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFB2BBC6)),
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(
                imagePath,
              ),
            ),
          ),
        ),
        const Gap(5),
      ],
    );
  }
}
