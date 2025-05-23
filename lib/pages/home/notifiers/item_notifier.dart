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
  // DocumentSnapshot? _lastDocument; // Not used for now
  String _searchQuery = "";

  static const int pageSize = 20;

  List<ItemModel> get items => _items;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  bool get hasMore => _hasMore;
  bool get isFetchingMore => _isFetchingMore;

  ItemProvider() {
    fetchItems();
  }

  Future<void> fetchItems({String searchQuery = ""}) async {
    _isLoading = true;
    _searchQuery = searchQuery;
    _items = [];
    // _lastDocument = null; // Not used for now
    _hasMore = true;
    notifyListeners();

    try {
      final query = await _itemService.getItems(
        serachQuery: searchQuery,
        limit: pageSize,
      );
      _items = query;
      // For pagination, get the last document
      if (query.length < pageSize) {
        _hasMore = false;
      }
      // _lastDocument is not set here because we filter after fetch for search
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
      // For now, we don't support search pagination (since we filter after fetch)
      final newItems = await _itemService.getItems(
        serachQuery: _searchQuery,
        limit: pageSize,
        // startAfterDoc: _lastDocument, // Not used for search
      );
      if (newItems.isEmpty || newItems.length < pageSize) {
        _hasMore = false;
      }
      _items.addAll(newItems);
      // _lastDocument = ...; // Not set due to search
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isFetchingMore = false;
      notifyListeners();
    }
  }
}
