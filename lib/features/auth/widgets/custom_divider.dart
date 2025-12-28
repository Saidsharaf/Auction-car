import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  final String text;
  final Color color;

  const OrDivider({
    super.key,
    this.text = 'أو سجل دخولك من خلال',
    this.color = Colors.white54,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(color: color, thickness: .8),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 9,
            ),
          ),
        ),
        Expanded(
          child: Divider(color: color, thickness: .8),
        ),
      ],
    );
  }
}
