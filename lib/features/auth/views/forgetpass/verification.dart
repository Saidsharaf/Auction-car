import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mazad/core/constants/app_colors.dart';
import 'package:mazad/features/auth/views/forgetpass/new_pass.dart';
import 'package:mazad/features/onBoarding/widgets/custom_text.dart';
import 'package:mazad/shared/custom_button.dart';
import 'package:mazad/shared/custom_navigate.dart';
import 'package:gap/gap.dart';


class VerificationPass extends StatefulWidget {
  const VerificationPass({super.key});

  @override
  State<VerificationPass> createState() => _VerificationPassState();
}

class _VerificationPassState extends State<VerificationPass> {
  final List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    super.dispose();
  }

  String getCode() {
    return controllers.map((e) => e.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
            title: CustomText(
              text: "رمز التحقق",
              size: 15,
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomText(
                  text:
                      "أدخل الرمز المرسل إلى الواتس اب",
                  size: 9,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff3D4C5E),
                ),
                SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Image.asset("assets/images/verfication.png"),
                ),
                /// OTP Fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    4,
                    (index) => _otpField(index),
                  ),
                ),
      
                const Gap(85),
      
                /// Confirm Button
                  CustomButton(
                    text: "تحقق",
                    size: 13,
                    fontWeight: FontWeight.w600,
                    onTap: () {
                      navigate(context,const NewPass());
                    },
                    color: const Color(0xff909DAD),
                    bgColor:
                        // ignore: deprecated_member_use
                        const Color.fromARGB(217, 217, 217, 178).withOpacity(.7),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Single OTP box
Widget _otpField(int index) {
  return SizedBox(
    height: 40,
    width: 60,
    child: TextFormField(
      controller: controllers[index],
      autofocus: index == 0,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 15),
      cursorHeight: 18,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 0.4),
        ),
      ),
      onChanged: (value) {
        if (value.isNotEmpty && index < 3) {
          FocusScope.of(context).nextFocus();
        }
        if (value.isEmpty && index > 0) {
          FocusScope.of(context).previousFocus();
        }
      },
    ),
  );
}

}
