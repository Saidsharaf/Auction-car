import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        style: const TextStyle(
          fontSize: 12,
        ),
        cursorHeight: 15,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: 'ماذا تبحث عن ؟',
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.7),
            fontSize: 10,
          ),
          suffixIcon: const Icon(
            CupertinoIcons.search,
            size: 18,
            color: Color(0xFF3D4C5E),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              // ignore: deprecated_member_use
              color: Color(0xFF909DAD),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
