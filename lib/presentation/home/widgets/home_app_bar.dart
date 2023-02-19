// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.barColor,
    this.textColor,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color barColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: barColor,
      ),
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: Icon(
              icon,
              color: textColor,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: TextStyle(
              // Here ?? means if the value of textColor is null, then apply Colors.black. If it's not null, it will apply textColor.
              color: textColor ?? Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
