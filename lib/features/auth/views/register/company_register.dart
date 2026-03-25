import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mazad/core/constants/app_colors.dart';
import 'package:mazad/features/auth/views/login_view.dart';
import 'package:mazad/features/auth/widgets/upload_container.dart';
import 'package:mazad/features/onBoarding/widgets/custom_text.dart';
import 'package:mazad/shared/custom_button.dart';
import 'package:mazad/shared/custom_navigate.dart';
import 'package:mazad/shared/custom_txtfield.dart';
import 'package:gap/gap.dart';

class CompanyRegister extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController numberController;
  final TextEditingController passController;
  final GlobalKey<FormState> formKey;

  const CompanyRegister(
      {super.key,
      required this.nameController,
      required this.emailController,
      required this.numberController,
      required this.passController,
      required this.formKey});

  @override
  State<CompanyRegister> createState() => _CompanyRegisterState();
}

class _CompanyRegisterState extends State<CompanyRegister> {
  namecontroller() => widget.nameController;
  emailcontroller() => widget.emailController;
  numbercontroller() => widget.numberController;
  passcontroller() => widget.passController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const CustomText(
          text: "اسم الشركة",
          size: 8,
          color: Color(0xff6C7278),
        ),
        const Gap(2),
        CustomTxtfield(
          controller: namecontroller(),
          hint: "اسم الشركة",
          isPassword: false,
        ),
        const Gap(10),
        const CustomText(
          text: "ادخل بريدك الالكتروني",
          size: 8,
          color: Color(0xff6C7278),
        ),
        const Gap(2),
        CustomTxtfield(
          controller: emailcontroller(),
          hint: 'البريد الالكتروني',
          isPassword: false,
          keyboardType: TextInputType.emailAddress,
        ),
        const Gap(10),
        const CustomText(
          text: "ادخل رقم الهاتف المرتبط بالواتس اب",
          size: 8,
          color: Color(0xff6C7278),
        ),
        const Gap(2),
        CustomTxtfield(
          controller: numbercontroller(),
          hint: 'رقم الهاتف',
          isPassword: false,
          keyboardType: TextInputType.phone,
        ),
        const Gap(10),
        const CustomText(
          text: "ادخل كلمة المرور",
          size: 8,
          color: Color(0xff6C7278),
        ),
        const Gap(2),
        CustomTxtfield(
          controller: passcontroller(),
          hint: 'كلمة المرور',
          isPassword: true,
        ),
        const Gap(10),
        const CustomText(
          text: "ارفق صورة السجل التجاري",
          size: 8,
          color: Color(0xff6C7278),
        ),
        const Gap(2),
        uploadContainer(
          onTap: () {},
        ),
        const Gap(10),
        const CustomText(
          text: "أرفق صورة جواز السفر",
          size: 8,
          color: Color(0xff6C7278),
        ),
        const Gap(2),
        uploadContainer(
          onTap: () {},
        ),
        const Gap(30),
        CustomButton(
          onTap: () {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const Root(),
            //   ),
            // );
            if (widget.formKey.currentState!.validate()) {
              // Perform login action
            }
          },
          size: 13,
          fontWeight: FontWeight.w600,
          text: 'انشئ الحساب',
        ),
        const Gap(15),
        Center(
          child: RichText(
            text: TextSpan(
              text: 'هل لديك حساب بالفعل ؟ ',
              style: const TextStyle(
                color: Color(0xff546881),
                fontSize: 13,
              ),
              children: [
                TextSpan(
                  text: 'تسجيل الدخول',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      navigateAndFinish(context, const LoginView());
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
