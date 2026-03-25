import 'package:flutter/material.dart';
import 'package:mazad/features/onBoarding/widgets/custom_text.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class CarCategory extends StatelessWidget {
  String image;
  String text;
  CarCategory({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Card(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(9),
             CustomText(
              text: text,
              size: 9,
            ),
          ],
        ),
      ),
    );
  }
}
