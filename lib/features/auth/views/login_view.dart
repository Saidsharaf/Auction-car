import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mazad/core/constants/app_colors.dart';
import 'package:mazad/features/auth/widgets/custom_btn.dart';
import 'package:mazad/features/auth/widgets/custom_divider.dart';
import 'package:mazad/features/auth/widgets/custom_social_media.dart';
import 'package:mazad/features/onBoarding/widgets/custom_text.dart';
import 'package:mazad/root.dart';
import 'package:mazad/shared/custom_button.dart';
import 'package:mazad/shared/custom_txtfield.dart';
import 'package:mazad/shared/gradiant_scaffold.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isLoading = false;
  List<String> socialMediaImages = [
    'assets/images/google.png',
    'assets/images/facebook.png',
    'assets/images/apple.png'
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: GradientScaffold(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, top: 100, right: 10.0, bottom: 30),
          child: Container(
            height: 1000,
            decoration: const BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Gap(70),
                      const CustomText(
                        text: 'تسجيل الدخول ',
                        color: Color(0xff090B0E),
                        size: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      const CustomText(
                        text:
                            'أدخل بريدك الإلكتروني وكلمة المرور لتسجيل الدخول ',
                        color: Color(0xff6C7278),
                        size: 8,
                      ),
                      const Gap(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const CustomText(
                            text: "ادخل بريدك الالكتروني",
                            size: 10,
                            color: Color(0xff6C7278),
                          ),
                          const Gap(2),
                          CustomTxtfield(
                            controller: emailController,
                            hint: 'البريد الالكتروني',
                            isPassword: false,
                          ),
                        //  const Gap(10),
                          const CustomText(
                            text: "ادخل كلمة المرور",
                            size: 10,
                            color: Color(0xff6C7278),
                          ),
                          const Gap(2),
                          CustomTxtfield(
                            controller: passController,
                            hint: 'كلمة المرور',
                            isPassword: true,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const CustomText(
                                text: 'هل نسيت كلمة المرور؟',
                                size: 10,
                                color: Color(0xffFF6D29),
                              ),
                              const Spacer(),
                              Text(
                                'تذكرني',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  color: const Color(0xff546881),
                                ),
                              ),
                              Checkbox(
                                value: false,
                                activeColor: AppColors.primary,
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                           CustomButton(
                            onTap: (){
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const Root(),
                              //   ),
                              // );
                              if (formKey.currentState!.validate()) {
                                // Perform login action
                              }
                            },
                            size: 13,
                            fontWeight: FontWeight.w600,
                            text: 'تسجيل الدخول',
                          ),
                          const Gap(15),
                          const OrDivider(
                            text: "او سجل دخولك من خلال",
                            color: Color(0xff546881),
                          ),
                          const Gap(10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...List.generate(
                                  socialMediaImages.length,
                                  (index) => CustomSocialMedia(
                                    imagePath: socialMediaImages[index],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(20),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'أليس لديك حساب؟ ',
                                style: const TextStyle(
                                  color: Color(0xff546881),
                                  fontSize: 13,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'انشئ حساب',
                                    style: TextStyle(
                                      color:AppColors.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // navigate to register
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
