import 'package:fitness_app/pages/home/explore_programs_page.dart';
import 'package:fitness_app/pages/home/my_program_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: _appBar(),
      body: Column(
        children: [
          Material(
            elevation: 0, // Shadow
            child: Container(
              color: Theme.of(context).colorScheme.onSurface,
              child: TabBar(
                controller: _tabController,
                padding: const EdgeInsets.symmetric(vertical: 8),
                labelColor: Theme.of(context).colorScheme.primary,
                labelStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3,
                dividerHeight: 3,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Theme.of(context).colorScheme.primary,
                tabs: const [
                  Tab(text: 'My Programs'),
                  Tab(text: 'Explore Programs'),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [MyProgramsPage(), ExploreProgramsPage()],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
      elevation: 4,
      titleSpacing: 8,
      title: Text(
        'Home',
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      leadingWidth: 45,
      leading: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          shape: BoxShape.circle,
        ),
        width: 35,
        height: 36,
        child: Center(
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, size: 18, weight: 900),
            color: Colors.black,
            padding: EdgeInsets.zero,
            constraints: BoxConstraints.tightFor(width: 36, height: 36),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
