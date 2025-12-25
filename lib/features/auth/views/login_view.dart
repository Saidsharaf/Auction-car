import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mazad/features/auth/widgets/custom_btn.dart';
import 'package:mazad/features/onBoarding/widgets/custom_text.dart';
import 'package:mazad/root.dart';
import 'package:mazad/shared/custom_button.dart';
import 'package:mazad/shared/custom_txtfield.dart';
import 'package:mazad/shared/glass_container.dart';


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
//  final authRepo = AuthRepo();

  // Future<void> login() async {
  //   if (!formKey.currentState!.validate()) return;
  //   setState(() => isLoading = true);

  //   try {
  //     final user = await authRepo.login(
  //       emailController.text.trim(),
  //       passController.text.trim(),
  //     );
  //     if (user != null) Navigator.push(context, MaterialPageRoute(builder: (_) =>  Root()));
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       customSnack(e is ApiError ? e.message : 'Unhandled login error'),
  //     );
  //   } finally {
  //     setState(() => isLoading = false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: glassContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Gap(175),
                  // Banner(
                  //   color: Colors.green.shade700,
                  //   message: 'auction car',
                  //   location: BannerLocation.topStart,
                  //   child: SvgPicture.asset('assets/logo/logo.svg', color: Colors.white70),
                  // ),
                  const Gap(10),
                  const CustomText(
                    text: 'تسجيل الدخول ',
                    color: Colors.white70,
                    size: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  const Gap(50),
                  Column(
                    children: [
                      CustomTxtfield(
                        controller: emailController,
                        hint: 'البريد الالكتروني',
                        isPassword: false,

                      ),
                      const Gap(10),
                      CustomTxtfield(
                        controller: passController,
                        hint: 'كلمة المرور',
                        isPassword: true,
                      ),
                      const Gap(20),
                      const CustomButton(
                        size: 13,
                        fontWeight: FontWeight.w500,
                        // height: 45,
                        // gap: 10,
                        text: 'تسجيل الدخول',
                        // color: Colors.white.withOpacity(0.9),
                        //textColor: AppColors.primary,
                        // widget: isLoading
                        //     ? CupertinoActivityIndicator(color: AppColors.primary)
                        //     : null,
                        // onTap: login,
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          Expanded(
                            child: CustomAuthBtn(
                              text: 'انشاء حساب',
                              onTap: () {
                                
                              },
                              textColor: Colors.white,
                              // onTap: () => Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(builder: (_) => const SignupView()),
                              // ),
                            ),
                          ),
                          const Gap(15),
                          Expanded(
                            child: CustomAuthBtn(
                              text: 'زائر',
                              isIcon: true,
                              textColor: Colors.white,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const Root()),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
