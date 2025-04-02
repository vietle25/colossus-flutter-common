abstract class FirebaseDatabaseHelper {
  /// Creates a new item in the specified collection.
  ///
  /// [collection] is the name of the collection.
  /// [item] is the data of the item to be created.
  Future<void> createItem(
    String collection, {
    required Map<String, dynamic> item,
  });

  /// Updates an existing item in the specified collection.
  ///
  /// [collection] is the name of the collection.
  /// [id] is the ID of the item to be updated.
  /// [item] is the new data for the item.
  Future<void> updateItem(
    String collection, {
    required String id,
    required Map<String, dynamic> item,
  });

  /// Deletes an item from the specified collection.
  ///
  /// [collection] is the name of the collection.
  /// [id] is the ID of the item to be deleted.
  Future<void> deleteItem(String collection, {required String id});

  /// Adds a new item to the specified collection.
  ///
  /// [collection] is the name of the collection.
  /// [item] is the data of the item to be added.
  Future<void> addItemToList(
    String collection, {
    required Map<String, dynamic> item,
  });

  /// Removes an item from the specified collection.
  ///
  /// [collection] is the name of the collection.
  /// [id] is the ID of the item to be removed.
  Future<void> removeItemFromList(
    String collection, {
    required String id,
  });

  /// Retrieves a list of items from the specified collection.
  ///
  /// [collection] is the name of the collection.
  Future<List<Map<String, dynamic>>> getList(String collection);

  /// Retrieves a single item from the specified collection.
  ///
  /// [collection] is the name of the collection.
  /// [id] is the ID of the item to be retrieved.
  Future<Map<String, dynamic>?> getItem(String collection, String id);
}
