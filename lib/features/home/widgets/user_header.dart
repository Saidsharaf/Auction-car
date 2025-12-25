import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mazad/features/onBoarding/widgets/custom_text.dart';
import '../../../core/constants/app_colors.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'مرحبًا , ',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 10,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      TextSpan(
                        text: 'سُعده',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomText(
                  text: "ابحث عن الفرصة!",
                  size: 8,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
            const Gap(9),
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.primary.withOpacity(0.5),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primary,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset('assets/test/kunckles.jpg'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
