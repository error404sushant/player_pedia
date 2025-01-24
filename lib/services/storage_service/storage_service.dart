import 'package:hive/hive.dart';

class HiveManager {
  // Assuming you've already opened your boxes and they're accessible by their names
  static Box getBox(String boxName) {
    return Hive.box(boxName);
  }

  /// Save data to a specific box
  static Future<void> saveData<T>({required String boxName, required String key, required dynamic value}) async {
    var box = getBox(boxName);
    await box.put(key, value);
  }

  /// Retrieve data from a specific box
  static T? getData<T>({required String boxName, required String key}) {
    var box = getBox(boxName);
    return box.get(key) as T?;
  }

  /// Delete data from a specific box
  static Future<void> deleteData({required String boxName, required String key}) async {
    var box = getBox(boxName);
    await box.delete(key);
  }

  /// Clear all data in a specific box
  static Future<void> clearAllData({required String boxName}) async {
    var box = getBox(boxName);
    await box.clear();
  }

  /// Check if a key exists in a specific box
  static bool hasKey({required String boxName, required String key}) {
    var box = getBox(boxName);
    return box.containsKey(key);
  }

  /// Add or update an object in a list stored in a Hive box
  static Future<void> addOrUpdateInList<T>({
    required String boxName,
    required String key,
    required dynamic object,
    required bool Function(T) condition,
  }) async {
    var box = getBox(boxName);
    List<dynamic> objectsList = box.get(key, defaultValue: []) as List<dynamic>;

    // Check if the object exists in the list based on the condition
    int index = objectsList.indexWhere((existingObject) => condition(existingObject));

    if (index != -1) {
      // Update the existing object
      objectsList[index] = object;
    } else {
      // Add the new object to the list
      objectsList.add(object);
    }

    // Save the updated list back to Hive
    await box.put(key, objectsList);
  }
}