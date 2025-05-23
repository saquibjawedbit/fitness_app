import 'package:flutter/material.dart';

class TagView extends StatelessWidget {
  const TagView({
    super.key,
    required this.tagName,
    required this.isInverted,
    required this.icon,
    this.iconColor,
  });

  final String tagName;
  final bool isInverted;
  final IconData icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: (isInverted ? Colors.white : Color.fromARGB(255, 76, 136, 255)),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Color.fromARGB(255, 76, 136, 255)),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color:
                iconColor ??
                (!isInverted
                    ? Colors.white
                    : Color.fromARGB(255, 76, 136, 255)),
          ),
          SizedBox(width: 8),
          Text(
            tagName,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: isInverted
                  ? Color.fromARGB(255, 76, 136, 255)
                  : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
