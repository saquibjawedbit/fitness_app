import 'package:flutter/material.dart';

class TagView extends StatelessWidget {
  const TagView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 76, 136, 255),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Icon(Icons.flag_outlined, size: 24, color: Colors.white),
          SizedBox(width: 8),
          Text(
            "Fitness",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
