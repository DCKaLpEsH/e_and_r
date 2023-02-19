import 'package:flutter/material.dart';

class CompanyDetailsCard extends StatelessWidget {
  const CompanyDetailsCard({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
    required this.buttonColor,
    required this.buttonText,
  }) : super(key: key);
  final String title;
  final String description;
  final VoidCallback onTap;
  final Color buttonColor;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Description: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            description,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: SizedBox(
              width: 140,
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  disabledBackgroundColor: const Color(0xFFA0A0A0),
                  shape: const StadiumBorder(),
                  backgroundColor: buttonColor,
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
