import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mazad/core/constants/app_colors.dart';
import 'package:mazad/features/auth/views/login_view.dart';
import 'package:mazad/features/auth/views/register/register_view.dart';
import 'package:mazad/features/onBoarding/model/onboarding_model.dart';
import 'package:mazad/features/onBoarding/widgets/custom_text.dart';
import 'package:mazad/root.dart';
import 'package:mazad/shared/custom_button.dart';
import 'package:mazad/shared/custom_navigate.dart';
import 'package:mazad/shared/custom_text_btn.dart';
import 'package:mazad/shared/custom_unfilled_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController controller;
  bool islast = false;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for (var page in OnboardingData.pages) {
      precacheImage(
        AssetImage(page.imageAsset),
        context,
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child:
              CustomText(text: "تخطي", size: 15, fontWeight: FontWeight.w500),
        ),
        leadingWidth: 100,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              itemCount: OnboardingData.pages.length,
              onPageChanged: (index) {
                setState(() {
                  islast = index == OnboardingData.pages.length - 1;
                });
              },
              itemBuilder: (context, index) {
                final page = OnboardingData.pages[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const Spacer(flex: 2),
                      SizedBox(
                        height: 180,
                        child: Image.asset(
                          page.imageAsset,
                          fit: BoxFit.cover,
                          cacheWidth: 400,
                        ),
                      ),
                      const Gap(20),
                      SmoothPageIndicator(
                        controller: controller,
                        count: OnboardingData.pages.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: AppColors.primary,
                          dotColor: Colors.grey.shade300,
                          dotHeight: 8,
                          dotWidth: 12,
                        ),
                      ),
                      const Gap(30),
                      CustomText(
                        text: page.title,
                        size: 11,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                      const Gap(10),
                      CustomText(
                        text: page.description,
                        size: 10,
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(flex: 3),
                    ],
                  ),
                );
              },
            ),
          ),
          islast
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    children: [
                      CustomButton(
                        onTap: () {
                          navigateAndFinish(context, const LoginView());
                        },
                        text: "تسجيل الدخول",
                        size: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      const Gap(10),
                      CustomUnfilledButton(
                        onTap: () {
                          navigateAndFinish(context, const RegisterView());
                        },
                        text: "انشاء حساب",
                        size: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomTextBtn(
                        onPressed: () {
                          navigateAndFinish(context, const Root());
                        },
                        text: "دخول كزائر",
                        size: 12,
                        textDecoration: TextDecoration.underline,
                        decorationColor: AppColors.primary,
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: GestureDetector(
                    onTap: () {
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
                ),
        ],
      ),
    );
  }
}
