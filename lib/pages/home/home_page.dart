import 'package:fitness_app/pages/home/explore_programs_page.dart';
import 'package:fitness_app/pages/home/my_program_page.dart';
import 'package:flutter/material.dart';

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
      body: _body(context),
      bottomNavigationBar: _navBar(context),
    );
  }

  Widget _navBar(BuildContext context) {
    int _selectedIndex = 0;
    return StatefulBuilder(
      builder: (context, setState) {
        return BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          elevation: 6,
          items: [
            BottomNavigationBarItem(
              icon: _buildNavIcon(Icons.home, _selectedIndex == 0),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(Icons.fitness_center, _selectedIndex == 1),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(Icons.calendar_today, _selectedIndex == 2),
              label: '',
            ),
          ],
        );
      },
    );
  }

  Widget _buildNavIcon(IconData icon, bool isSelected) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.grey[500],
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }

  Column _body(BuildContext context) {
    return Column(
      children: [
        _tabViewController(context),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [MyProgramsPage(), ExploreProgramsPage()],
          ),
        ),
      ],
    );
  }

  Material _tabViewController(BuildContext context) {
    return Material(
      elevation: 0, // Shadow
      child: Container(
        color: Theme.of(context).colorScheme.onSurface,
        child: TabBar(
          controller: _tabController,
          padding: const EdgeInsets.symmetric(vertical: 8),
          labelColor: Theme.of(context).colorScheme.primary,
          labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
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
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
      elevation: 4,
      titleSpacing: 8,
      title: _title(),
      leadingWidth: 45,
      leading: _appBarIcons(),
    );
  }

  Container _appBarIcons() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade500,
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
    );
  }

  Text _title() {
    return Text(
      'Home',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Colors.black,
      ),
    );
  }
}
