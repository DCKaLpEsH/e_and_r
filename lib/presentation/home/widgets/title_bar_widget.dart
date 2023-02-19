import 'package:flutter/material.dart';

class TitleBarWidget extends StatelessWidget {
  const TitleBarWidget({
    Key? key,
    required this.title,
    required this.barColor,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final Color barColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: barColor,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      width: double.maxFinite,
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: onTap,
            child: const SizedBox(
              child: Text(
                'See All',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
