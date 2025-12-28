import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget {
  final Widget child;

  const GradientScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.mainGradient,
        ),
        child: child,
      ),
    );
  }
}

class AppGradients {
  static const LinearGradient mainGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 255, 246, 242),
         Color.fromARGB(255, 250, 206, 184),
     Color.fromARGB(255, 250, 163, 119),
     Color.fromARGB(255, 255, 151, 100),
    ],
  );
}