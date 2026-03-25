import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mazad/core/constants/app_colors.dart';
import 'package:mazad/features/onBoarding/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class CustomPost extends StatelessWidget {
  const CustomPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.primary,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CustomText(
                  text: "سعيد شرف",
                  size: 9,
                  fontWeight: FontWeight.w600,
                ),
                const Gap(5),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: AppColors.primary,
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/test/kunckles.jpg'),
                  ),
                ),
              ],
            ),
            const Gap(11),
            const CustomText(
              text:
                  "للبيع سيارة تويوتا كامري 2020 بحالة ممتازة، قطعت 45 ألف كم فقط. السعر قابل للتفاوض 🚗",
              size: 8,
            ),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    CustomText(text: "20", size: 8),
                     Gap(5),
                    Icon(CupertinoIcons.share_up, size: 14),  
                  ],
                ),
                Row(
                  children: [
                    CustomText(text: "45", size: 8),
                     Gap(5),
                     Icon(CupertinoIcons.chat_bubble, size: 14),                
                  ],
                ),
                Row(
                  children: [
                    CustomText(text: "120", size: 8),
                    Gap(5),
                    Icon(CupertinoIcons.heart, size: 14),
                    
                    
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
