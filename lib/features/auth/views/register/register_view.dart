import 'package:flutter/material.dart';
import 'package:mazad/features/auth/views/register/company_register.dart';
import 'package:mazad/features/auth/views/register/individual_register.dart';
import 'package:mazad/features/onBoarding/widgets/custom_text.dart';
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
  AnimatedSwitcher(
  duration: const Duration(milliseconds: 800),
  transitionBuilder: (child, animation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  },
  child: selectedIndex == 0
      ? IndividualRegister(
          key: const ValueKey('individual'),
          nameController: nameController,
          emailController: emailController,
          numberController: numberController,
          passController: passController,
          formKey: formKey,
        )
      : CompanyRegister(
          key: const ValueKey('company'),
          nameController: nameController,
          emailController: emailController,
          numberController: numberController,
          passController: passController,
          formKey: formKey,
        ),
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
              fontSize: 11.5,
              fontWeight: FontWeight.w300,
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
