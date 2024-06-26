import 'package:flutter/material.dart';
import 'package:learn/utils/fontstyles.dart';

class QuickAccessCard extends StatelessWidget {
  final String title;
  final String icon;
  final Color color;
  final Color borderColor;
  final VoidCallback? onTap;
  final bool unlocked;

  const QuickAccessCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    this.borderColor = Colors.transparent,
    this.unlocked = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
              color: borderColor == Colors.transparent ? color : borderColor),
          borderRadius: BorderRadius.circular(16),
        ),
        width: 120,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(icon,
                  color: unlocked
                      ? const Color(0xFF060C20)
                      : const Color(0xFFD9D9D9)),
              const SizedBox(height: 8),
              Text(title,
                  style: unlocked
                      ? FontStyles.body3MediumBlack
                      : const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Spartan',
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFD9D9D9),
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
