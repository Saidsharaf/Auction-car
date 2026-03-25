import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mazad/core/constants/app_colors.dart';
import 'package:mazad/features/onBoarding/widgets/custom_text.dart';
import 'package:gap/gap.dart';
import 'package:mazad/shared/custom_button.dart';
import 'package:mazad/shared/custom_unfilled_button.dart';

class CardCarauction extends StatelessWidget {
  const CardCarauction({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Stack(
        children: [
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/car2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                const Gap(9),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const CustomText(
                        text: "toyota land cruiser 2020",
                        size: 8.5,
                        fontWeight: FontWeight.w600,
                      ),
                      const Gap(5),
                      const CustomText(
                        text: "النوع: سيدان",
                        size: 8,
                      ),
                      const Gap(11),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              CustomText(
                                text: "عدد المزايدات",
                                size: 8,
                              ),
                              CustomText(
                                text: "8",
                                size: 8,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomText(
                                text: "السعر الابتدائي",
                                size: 8,
                              ),
                              CustomText(
                                text: "250,000 ج.م",
                                size: 8,
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Gap(5),
                      CustomUnfilledButton(
                        onTap: () {},
                        text: "اشتري الآن بـ 320,000 ج.م",
                        size: 8,
                        fontWeight: FontWeight.w600,
                      ),
                      const Gap(5),
                      CustomButton(
                        text: "ادخل المزاد",
                        size: 10,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 95,
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF0EA),
                borderRadius: BorderRadius.circular(5),
              ),
              child: CustomText(
                text: "متبقي: 4 ساعات",
                size: 8,
                color: AppColors.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
