// Concrete implementation of the DatabaseHelper interface for Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'firebase_database_helper.dart';

class FirebaseDatabaseHelper implements DatabaseHelper {
  // Private member variable to hold the reference to the database
  final DatabaseReference _databaseReference;

  // Constructor to initialize the database reference
  FirebaseDatabaseHelper() : _databaseReference = FirebaseDatabase.instance.ref().child('items');

  /// Static method to initialize Firebase.
  ///
  /// This should be called once before using the helper class to ensure
  /// Firebase is properly set up.
  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  /// Creates or updates an item in the database.
  ///
  /// Parameters:
  /// - [itemId]: The unique identifier for the item.
  /// - [itemData]: A map containing the item's data.
  @override
  Future<void> createOrUpdateItem(String itemId, Map<String, dynamic> itemData) async {
    await _databaseReference.child(itemId).set(itemData);
  }

  /// Deletes an item from the database.
  ///
  /// Parameters:
  /// - [itemId]: The unique identifier for the item to be deleted.
  @override
  Future<void> deleteItem(String itemId) async {
    await _databaseReference.child(itemId).remove();
  }

  /// Gets a reference to the list of items in the database.
  ///
  /// Returns: A [DatabaseReference] to the items node, allowing further
  /// operations such as adding listeners to retrieve data.
  @override
  DatabaseReference getItemList() {
    return _databaseReference;
  }

  /// Inserts a list of items into the database.
  ///
  /// Parameters:
  /// - [items]: A map of item IDs to item data. This will set the entire
  /// items node to the provided list, replacing any existing data.
  @override
  Future<void> insertItemList(Map<String, Map<String, dynamic>> items) async {
    await _databaseReference.set(items);
  }

  /// Removes an item from the list in the database.
  ///
  /// Parameters:
  /// - [itemId]: The unique identifier for the item to be removed.
  @override
  Future<void> removeItemFromList(String itemId) async {
    await _databaseReference.child(itemId).remove();
  }
}
