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
      appBar: AppBar(
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
      ),
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
}

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
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search programs',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.grey.shade700),
                  onPressed: () {},
                ),
                Container(height: 24, width: 1, color: Colors.grey.shade400),
                IconButton(
                  icon: Icon(Icons.filter_list, color: Colors.grey.shade700),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExploreProgramsPage extends StatelessWidget {
  const ExploreProgramsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Explore Programs'));
  }
}
