import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mazad/core/constants/app_colors.dart';
import 'package:mazad/features/auth/views/login_view.dart';
import 'package:mazad/features/onBoarding/widgets/custom_text.dart';
import 'package:mazad/shared/custom_button.dart';
import 'package:mazad/shared/custom_navigate.dart';
import 'package:mazad/shared/custom_txtfield.dart';
import 'package:mazad/shared/gradiant_scaffold.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

final formKey = GlobalKey<FormState>();
final emailController = TextEditingController();
final passController = TextEditingController();
final nameController = TextEditingController();
final numberController = TextEditingController();
int selectedIndex = 0;

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Colors.white,
    //       elevation: 0,
    //       centerTitle: true,
    //       title: const Text(
    //         "إنشاء حساب",
    //         style: TextStyle(color: Colors.black),
    //       ),
    //       bottom: const TabBar(
    //         labelColor: Colors.orange,
    //         unselectedLabelColor: Colors.grey,
    //         indicatorColor: Colors.orange,
    //         tabs: [
    //           Tab(text: "منشأة"),
    //           Tab(text: "فرد"),
    //         ],
    //       ),
    //     ),
    //     body: const TabBarView(
    //       children: [
    //         CompanyRegister(),
    //         IndividualRegister(),
    //       ],
    //     ),
    //   ),
    // );
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: GradientScaffold(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, top: 60, right: 10.0, bottom: 30),
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
                    const Gap(10),
                    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _item(title: "منشأة", index: 1),
        const SizedBox(width: 30),
          _item(title: "فرد", index: 0),
      ],
    ),
                      const CustomText(
                        text: 'انشاء حساب',
                        color: Color(0xff090B0E),
                        size: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      const CustomText(
                        text: 'ابدأ بإنشاء حساب جديد',
                        color: Color(0xff6C7278),
                        size: 9,
                      ),
                      const Gap(20),
                      selectedIndex== 0?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const CustomText(
                            text: "الاسم بالكامل",
                            size: 8,
                            color: Color(0xff6C7278),
                          ),
                          const Gap(2),
                          CustomTxtfield(
                            controller: nameController,
                            hint: 'الاسم بالكامل',
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
                            controller: emailController,
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
                            controller: numberController,
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
                            controller: passController,
                            hint: 'كلمة المرور',
                            isPassword: true,
                          ),
                          const Gap(40),
                          CustomButton(
                            onTap: () {
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
                            text: 'انشئ الحساب',
                          ),
                          const Gap(20),
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
                                        navigateAndFinish(
                                            context, const LoginView());
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ): SizedBox(),
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
  
  Widget _item({required String title, required int index}) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.orange : Colors.grey,
            ),
          ),
          const SizedBox(height: 6),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 2,
            width: isSelected ? 40 : 0,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
