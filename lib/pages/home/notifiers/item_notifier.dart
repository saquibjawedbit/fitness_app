import 'package:fitness_app/models/item_model.dart';
import 'package:flutter/material.dart';
import '../../../services/item_service.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class ItemProvider with ChangeNotifier {
  final ItemService _itemService = ItemService();
  List<ItemModel> _items = [];
  bool _isLoading = false;
  String _errorMessage = '';
  bool _hasMore = true;
  bool _isFetchingMore = false;
  String _searchQuery = "";
  String _status = "All";

  static const int pageSize = 20;

  List<ItemModel> get items => _items;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  bool get hasMore => _hasMore;
  bool get isFetchingMore => _isFetchingMore;
  String get status => _status;

  ItemProvider() {
    fetchItems();
  }

  Future<void> fetchItems({
    String searchQuery = "",
    String status = "All",
  }) async {
    _isLoading = true;
    _searchQuery = searchQuery;
    _status = status;
    _items = [];
    _hasMore = true;
    notifyListeners();

    try {
      final query = await _itemService.getItems(
        serachQuery: searchQuery,
        status: status,
        limit: pageSize,
      );
      _items = query;
      if (query.length < pageSize) {
        _hasMore = false;
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchMoreItems() async {
    if (!_hasMore || _isFetchingMore) return;
    _isFetchingMore = true;
    notifyListeners();
    try {
      final newItems = await _itemService.getItems(
        serachQuery: _searchQuery,
        status: _status,
        limit: pageSize,
      );
      if (newItems.isEmpty || newItems.length < pageSize) {
        _hasMore = false;
      }
      _items.addAll(newItems);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isFetchingMore = false;
      notifyListeners();
    }
  }

  void setSearchQuery(String query) {
    fetchItems(searchQuery: query, status: _status);
  }

  void setStatus(String status) {
    fetchItems(searchQuery: _searchQuery, status: status);
  }
}
