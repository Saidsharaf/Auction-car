 import 'package:flutter/material.dart';

void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
      (route) => false,
    );
void navigate(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Widget),
    );

  
