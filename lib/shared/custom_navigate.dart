 import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names, avoid_types_as_parameter_names
void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
      (route) => false,
    );
    // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
void navigate(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Widget),
    );

  
