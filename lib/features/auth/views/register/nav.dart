import 'package:flutter/material.dart';

class NavFromInividualToCompany extends StatefulWidget {
  const NavFromInividualToCompany({required this.title, required this.index, super.key});
  final String title;
  final int index;
  @override
  State<NavFromInividualToCompany> createState() => _NavFromInividualToCompanyState();
}

class _NavFromInividualToCompanyState extends State<NavFromInividualToCompany> {
      late final bool isSelected = selectedIndex == widget.index;

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = widget.index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
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