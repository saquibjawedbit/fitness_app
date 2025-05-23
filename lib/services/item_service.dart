import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/item_model.dart';

class ItemService {
  // This class is responsible for managing items in the application.

  Future<List<ItemModel>> getItems({
    String serachQuery = "",
    int limit = 20,
    DocumentSnapshot? startAfterDoc,
  }) async {
    try {
      debugPrint("Fetching items with search query: $serachQuery");

      Query query = FirebaseFirestore.instance.collection('items');
      if (serachQuery.isNotEmpty) {
        // For Firestore, you can't do contains, so we filter after fetch
      }
      if (startAfterDoc != null) {
        query = query.startAfterDocument(startAfterDoc);
      }
      query = query.limit(limit);

      final querySnapshot = await query.get();

      List<ItemModel> items = querySnapshot.docs
          .map(
            (doc) =>
                ItemModel.fromJson(doc.id, doc.data() as Map<String, dynamic>),
          )
          .toList();

      if (serachQuery.isNotEmpty) {
        items = items
            .where(
              (item) =>
                  item.name.toLowerCase().contains(serachQuery.toLowerCase()) ||
                  item.description.toLowerCase().contains(
                    serachQuery.toLowerCase(),
                  ),
            )
            .toList();
      }

      debugPrint("Fetched ${items.length} items");
      return items;
    } catch (e) {
      debugPrint("Error fetching items: $e");
      // Handle any errors that occur during the fetch
      throw Exception("Failed to load items");
    }
  }
}
