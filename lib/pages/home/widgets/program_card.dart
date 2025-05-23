import 'package:fitness_app/pages/home/widgets/tag_view.dart';
import 'package:flutter/material.dart';

class ProgramCard extends StatelessWidget {
  const ProgramCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(16),
          ),
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(children: [_image(), _priceTag(), _infoBar()]),
          ),
        ),
      ),
    );
  }

  Align _infoBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://placehold.co/100x100.png',
                  ),
                  radius: 16,
                ),
                SizedBox(width: 8),
                Text(
                  "Chris Bumstead",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(children: [TagView()]),
          ],
        ),
      ),
    );
  }

  Align _priceTag() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: const EdgeInsets.all(4.0),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 32, 77, 129),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          '\$999',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Image _image() {
    return Image.network(
      'https://placehold.co/600x400.png',
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }
}
