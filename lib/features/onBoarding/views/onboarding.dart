import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mazad/core/constants/app_colors.dart';
import 'package:mazad/features/auth/views/login_view.dart';
import 'package:mazad/features/onBoarding/model/onboarding_model.dart';
import 'package:mazad/features/onBoarding/widgets/custom_text.dart';
import 'package:mazad/root.dart';
import 'package:mazad/shared/custom_button.dart';
import 'package:mazad/shared/custom_navigate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

PageController controller = PageController();

class _OnboardingState extends State<Onboarding> {
  bool islast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:const Padding(
          padding:EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: CustomText(text: "تخطي", size: 15, fontWeight: FontWeight.w500),
        ),
        leadingWidth: 100,
      ),
      body: PageView.builder(
        itemCount: OnboardingData.pages.length,
        controller: controller,
        onPageChanged: (index) {
          if (index == OnboardingData.pages.length - 1) {
            // Last page reached
            setState(() {
              islast = true;
            });
          }
        },
        // physics:const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              double value = 1.0;
              if (controller.position.haveDimensions) {
                value = ((1 -
                        ((controller.page ?? controller.initialPage) - index)
                            .abs())
                    .clamp(0.0, 1.0)) as double;
              }
              return Opacity(
                opacity: value,
                child: Transform.scale(
                  scale: 0.9 + (value * 0.1),
                  child: child,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 180,
                    child: Image.asset(OnboardingData.pages[index].imageAsset,fit: BoxFit.cover,)),
                  const Gap(15),
                  SmoothPageIndicator(
                    controller: controller,
                    count: OnboardingData.pages.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.primary,
                      dotColor: Colors.grey.shade300,
                      dotHeight: 8,
                      dotWidth: 12,
                      spacing: 8,
                    )
                  ),
                  const Gap(35),
                  CustomText(
                      text: OnboardingData.pages[index].title,
                      size: 11,
                      fontWeight: FontWeight.w600),
                  const Gap(10),
                  CustomText(
                      text: OnboardingData.pages[index].description,
                      size: 10,
                      fontWeight: FontWeight.w400),
                  const Gap(80),
                  GestureDetector(
                    onTap: () {
                      islast?navigateAndFinish(context,const LoginView()):
                      controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const CustomButton(
                      text: "التالي",
                      size: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
