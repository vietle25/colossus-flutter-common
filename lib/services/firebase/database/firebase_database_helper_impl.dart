import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/log/log_mixin.dart';
import 'firebase_database_helper.dart';

class FirebaseDatabaseHelperImpl
    with LogMixin
    implements FirebaseDatabaseHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Creates a new item in the specified collection.
  ///
  /// [collection] is the name of the collection.
  /// [item] is the data of the item to be created.
  @override
  Future<void> createItem(
    String collection, {
    required Map<String, dynamic> item,
  }) async {
    try {
      await _firestore.collection(collection).add(item);
    } catch (e) {
      logE('Failed to create item: $e');
    }
  }

  /// Updates an existing item in the specified collection.
  ///
  /// [collection] is the name of the collection.
  /// [id] is the ID of the item to be updated.
  /// [item] is the new data for the item.
  @override
  Future<void> updateItem(
    String collection, {
    required String id,
    required Map<String, dynamic> item,
  }) async {
    try {
      await _firestore.collection(collection).doc(id).update(item);
    } catch (e) {
      logE('Failed to update item: $e');
    }
  }

  /// Deletes an item from the specified collection.
  ///
  /// [collection] is the name of the collection.
  /// [id] is the ID of the item to be deleted.
  @override
  Future<void> deleteItem(String collection, {required String id}) async {
    try {
      await _firestore.collection(collection).doc(id).delete();
    } catch (e) {
      logE('Failed to delete item: $e');
    }
  }

  /// Adds a new item to the specified collection.
  ///
  /// [collection] is the name of the collection.
  /// [item] is the data of the item to be added.
  @override
  Future<void> addItemToList(
    String collection, {
    required Map<String, dynamic> item,
  }) async {
    try {
      await _firestore.collection(collection).add(item);
    } catch (e) {
      logE('Failed to add item to list: $e');
    }
  }

  /// Removes an item from the specified collection.
  ///
  /// [collection] is the name of the collection.
  /// [id] is the ID of the item to be removed.
  @override
  Future<void> removeItemFromList(
    String collection, {
    required String id,
  }) async {
    try {
      await _firestore.collection(collection).doc(id).delete();
    } catch (e) {
      logE('Failed to remove item from list: $e');
    }
  }

  /// Retrieves a list of items from the specified collection.
  ///
  /// [collection] is the name of the collection.
  @override
  Future<List<Map<String, dynamic>>> getList(String collection) async {
    try {
      final querySnapshot = await _firestore.collection(collection).get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      logE('Failed to get list: $e');
      return [];
    }
  }

  /// Retrieves a single item from the specified collection.
  ///
  /// [collection] is the name of the collection.
  /// [id] is the ID of the item to be retrieved.
  @override
  Future<Map<String, dynamic>?> getItem(String collection, String id) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(id).get();
      return docSnapshot.data();
    } catch (e) {
      logE('Failed to get item: $e');
      return null;
    }
  }
}
