import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

Widget uploadContainer({ VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      dashPattern: const [6, 4],
      padding: const EdgeInsets.all(1),
      color: const Color.fromARGB(255, 204, 203, 203),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.cloud_upload_outlined,
          size: 28,
          color: Color(0xff546881),
        ),
      ),
    ),
  );
}
