import 'package:fitness_app/pages/home/widgets/program_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProgramsPage extends StatelessWidget {
  const MyProgramsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Programs",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 2),
          Text(
            "Explore to find your new goal",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),
          SizedBox(height: 16),
          _seardhBar(),
          SizedBox(height: 16),
          _scrollView(),
        ],
      ),
    );
  }

  Expanded _scrollView() {
    return Expanded(
      child: ListView.builder(
        itemCount:
            20, // Replace with your actual item count or use a large number for "infinite"
        itemBuilder: (context, index) {
          // You can add loading more logic when reaching bottom
          if (index == 19) {
            // Load more data when reaching the end
            // Add your pagination logic here
          }

          return ProgramCard();
        },
      ),
    );
  }

  Container _seardhBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search programs, trainers, goals...',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                cursorColor: Colors.grey.shade600,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.grey.shade700, size: 20),
            onPressed: () {},
          ),
          Container(height: 24, width: 1, color: Colors.grey.shade400),
          IconButton(
            icon: Icon(
              Icons.filter_list,
              color: Colors.grey.shade700,
              size: 20,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
