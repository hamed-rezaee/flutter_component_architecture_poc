import 'package:example/core/persistent_data_service/base_persistent_data_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService implements BasePersistentDataService {
  @override
  Future<void> delete(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(key);
  }

  @override
  Future<T?> read<T>(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.get(key) as T;
  }

  @override
  Future<void> write<T>(String key, T value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw Exception('SharedPreferencesService: Unsupported type.');
    }
  }
}
