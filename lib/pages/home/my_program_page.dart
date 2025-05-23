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
  // _searchController and _statusOptions are defined only once here

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
    _searchController.dispose();
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
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
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

  final TextEditingController _searchController = TextEditingController();
  final List<String> _statusOptions = ["All", "Easy", "Medium", "Hard"];

  // Only one dispose method should exist
  // Only one dispose method should exist. Remove any duplicate dispose methods in this class.

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
              child: Consumer<ItemProvider>(
                builder: (context, provider, _) {
                  return TextField(
                    controller: _searchController,
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
                    onChanged: (value) {
                      provider.setSearchQuery(value);
                    },
                  );
                },
              ),
            ),
          ),
          Consumer<ItemProvider>(
            builder: (context, provider, _) {
              return IconButton(
                icon: Icon(Icons.search, color: Colors.grey.shade700, size: 20),
                onPressed: () {
                  provider.setSearchQuery(_searchController.text);
                },
              );
            },
          ),
          Container(height: 24, width: 1, color: Colors.grey.shade400),
          Consumer<ItemProvider>(
            builder: (context, provider, _) {
              return IconButton(
                icon: Icon(
                  Icons.filter_list,
                  color: Colors.grey.shade700,
                  size: 20,
                ),
                onPressed: () async {
                  String? selected = await _showDialog(context, provider);
                  if (selected != null && selected != provider.status) {
                    provider.setStatus(selected);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Future<String?> _showDialog(BuildContext context, ItemProvider provider) {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select Status',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.grey.shade600),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ..._statusOptions.map((status) {
                  final isSelected = provider.status == status;
                  return InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Navigator.pop(context, status);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.blue.shade50
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: isSelected
                            ? Border.all(color: Colors.blue, width: 1.5)
                            : Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                      child: Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? Colors.blue
                                    : Colors.grey.shade400,
                                width: 2,
                              ),
                              color: isSelected
                                  ? Colors.blue
                                  : Colors.transparent,
                            ),
                            child: isSelected
                                ? Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                : null,
                          ),
                          SizedBox(width: 12),
                          Text(
                            status,
                            style: TextStyle(
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isSelected ? Colors.blue : Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
