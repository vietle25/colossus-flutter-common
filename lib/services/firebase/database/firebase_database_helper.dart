import 'package:firebase_database/firebase_database.dart';

// Abstract class defining the contract for database operations
abstract class DatabaseHelper {
  /// Creates or updates an item in the database.
  ///
  /// Parameters:
  /// - [itemId]: The unique identifier for the item.
  /// - [itemData]: A map containing the item's data.
  Future<void> createOrUpdateItem(String itemId, Map<String, dynamic> itemData);

  /// Deletes an item from the database.
  ///
  /// Parameters:
  /// - [itemId]: The unique identifier for the item to be deleted.
  Future<void> deleteItem(String itemId);

  /// Gets a reference to the list of items in the database.
  ///
  /// Returns: A [DatabaseReference] to the items node.
  DatabaseReference getItemList();

  /// Inserts a list of items into the database.
  ///
  /// Parameters:
  /// - [items]: A map of item IDs to item data.
  Future<void> insertItemList(Map<String, Map<String, dynamic>> items);

  /// Removes an item from the list in the database.
  ///
  /// Parameters:
  /// - [itemId]: The unique identifier for the item to be removed.
  Future<void> removeItemFromList(String itemId);
}
