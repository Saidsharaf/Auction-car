import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mazad/core/constants/app_colors.dart';
import 'package:mazad/features/onBoarding/widgets/custom_text.dart';
import 'package:mazad/shared/custom_button.dart';
import 'package:mazad/shared/custom_txtfield.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomText(
            text: "إعادة تعيين كلمة المرور",
            size: 15,
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomText(
                text:
                    "سوف نرسل لك رسالة لرقم الواتس اب لإعادة تعيين كلمة المرور الخاصة بك",
                size: 10,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
                color: Color(0xff3D4C5E),
              ),
              const Gap(50),
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
              const Gap(130),
              CustomButton(
                text: "ارسال",
                size: 13,
                fontWeight: FontWeight.w600,
                onTap: () {},
                color: const Color(0xff909DAD),
                // ignore: deprecated_member_use
                bgColor: const Color.fromARGB(217, 217, 217, 178).withOpacity(.7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
