import 'package:flutter/material.dart';
import 'package:mazad/core/constants/app_colors.dart';
import 'package:mazad/features/onBoarding/widgets/custom_text.dart';
import 'package:mazad/shared/custom_button.dart';
import 'package:mazad/shared/custom_txtfield.dart';
import 'package:gap/gap.dart';


class NewPass extends StatefulWidget {
  const NewPass({super.key});

  @override
  State<NewPass> createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomText(
            text: "تعيين كلمة مرور جديدة",
            size: 15,
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Center(
                  child: CustomText(
                    text: "أدخل كلمة المرور الجديدة",
                    size: 10,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff3D4C5E),
                  ),
                ),
                const Gap(20),
                const CustomText(
                  text: "ادخل كلمة المرور الجديدة",
                  size: 8,
                  color: Color(0xff6C7278),
                ),
                const Gap(2),
                CustomTxtfield(
                  controller: passwordController,
                  hint: 'كلمة المرور',
                  isPassword: true,
                ),
                const Gap(130),
                CustomButton(
                  text: "تعيين",
                  size: 13,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff909DAD),
                  // ignore: deprecated_member_use
                  bgColor:const Color.fromARGB(217, 217, 217, 178).withOpacity(.7),
                  onTap: () {
                  //  navigate(context, const VerificationPass());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
