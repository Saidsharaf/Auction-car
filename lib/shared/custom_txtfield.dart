import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class CustomTxtfield extends StatefulWidget {
  const CustomTxtfield(
      {super.key,
      required this.hint,
      required this.isPassword,
      required this.controller,
      this.keyboardType});
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  State<CustomTxtfield> createState() => _CustomTxtfieldState();
}

class _CustomTxtfieldState extends State<CustomTxtfield> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.isPassword;
    super.initState();
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      cursorHeight: 20,
      style: const TextStyle(fontSize: 14, color: Color(0xff1A1C1E)),
      controller: widget.controller,
      cursorColor: AppColors.primary,
      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'يرجي ملئ ${widget.hint}';
        }
        return null;
      },
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        prefixIcon: widget.isPassword
            ? GestureDetector(
                onTap: _togglePassword,
                child: const Icon(
                  CupertinoIcons.eye,
                  color: Color(0xffACB5BB),
                  size: 19,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 0.4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 0.7),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
        hintText: widget.hint,
    
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        // ignore: deprecated_member_use
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
