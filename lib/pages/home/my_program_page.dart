import 'package:fitness_app/models/item_model.dart';
import 'package:fitness_app/pages/home/notifiers/item_notifier.dart';
import 'package:fitness_app/pages/home/widgets/program_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProgramsPage extends StatefulWidget {
  const MyProgramsPage({super.key});

  @override
  State<MyProgramsPage> createState() => _MyProgramsPageState();
}

class _MyProgramsPageState extends State<MyProgramsPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ItemProvider>(context, listen: false).fetchItems();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final provider = Provider.of<ItemProvider>(context, listen: false);
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (provider.hasMore && !provider.isFetchingMore) {
        provider.fetchMoreItems();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Programs",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 2),
          Text(
            "Explore to find your new goal",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 16),
          _seardhBar(),
          SizedBox(height: 16),
          Consumer<ItemProvider>(
            builder: (context, provider, _) {
              return _scrollView(
                provider.items,
                provider.isLoading,
                provider.hasMore,
                provider.isFetchingMore,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _scrollView(
    List<ItemModel> items,
    bool isLoading,
    bool hasMore,
    bool isFetchingMore,
  ) {
    if (isLoading && items.isEmpty) {
      return Expanded(child: Center(child: CircularProgressIndicator()));
    }

    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: items.length + (hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < items.length) {
            return ProgramCard(item: items[index]);
          } else {
            // Show loading indicator at the end
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
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
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey.shade600,
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
