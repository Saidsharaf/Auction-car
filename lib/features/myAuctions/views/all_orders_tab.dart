import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mazad/features/onBoarding/widgets/custom_text.dart';
import 'package:mazad/shared/custom_unfilled_button.dart';

class AllOrdersTab extends StatelessWidget {
  const AllOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Card(
              color: const Color(0xFFFDFDFD),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomText(
                              text: "Toyota Corolla 2020",
                              size: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomText(
                              text: "النوع : سيدان",
                              size: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF6A7282),
                            ),
                            CustomText(
                              text: "السعر النهائي",
                              size: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF6A7282),
                            ),
                            CustomText(
                              text: "  250,553",
                              size: 8,
                              color: Color(0xFF008C1E),
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const Gap(5),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/images/car2.jpg",
                              width: 96,
                              height: 96,
                              fit: BoxFit.fill,
                            )),
                      ],
                    ),
                    const Gap(10),
                    const CustomUnfilledButton(
                      text: "إيصال إلكتروني",
                      size: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    const Gap(10),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 45,
              left: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 25,
                width: 60,
                child: const Center(
                  child: CustomText(
                    text: "مكتملة",
                    color: Color(0xFF008236),
                    size: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
