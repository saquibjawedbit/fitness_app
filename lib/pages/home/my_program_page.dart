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
          Container(
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
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey.shade700,
                    size: 20,
                  ),
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
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount:
                  20, // Replace with your actual item count or use a large number for "infinite"
              itemBuilder: (context, index) {
                // You can add loading more logic when reaching bottom
                if (index == 19) {
                  // Load more data when reaching the end
                  // Add your pagination logic here
                }

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
                        child: Stack(
                          children: [
                            Image.network(
                              'https://placehold.co/600x400.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                margin: const EdgeInsets.all(4.0),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 3,
                                ),
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
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                height: 100,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 4,
                                ),
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
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                              255,
                                              76,
                                              136,
                                              255,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              24,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.flag_outlined,
                                                size: 24,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                "Fitness",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
