import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:time_table_app/models/event_model.dart';
import 'package:time_table_app/utils/constants.dart';

final Logger log = Logger();

// Open hive box
Future<Box<dynamic>> _openHiveBox() async {
  try {
    final box = await Hive.openBox(hiveDb);
    // log.d('Hive opened successfully');
    return box;
  } catch (error, stackTrace) {
    log.e('Error initializing Hive', error, stackTrace);
    rethrow;
  }
}

// insert  data
Future<void> insertToLocal(
    {required String key, required List<Event> value}) async {
  final box = await _openHiveBox();
  box.put(key, value);

  log.d("'$key' inserted successfully");
}

// Retrive data
Future<List<Event>> readFromLocal({required String key}) async {
  final box = await _openHiveBox();
  return box.get(key);
}

// Clear Hive database
Future<void> clearLocalDb() async {
  try {
    final box = await _openHiveBox();
    await box.clear();
    log.d('Hive database cleared successfully');
  } catch (error, stackTrace) {
    log.e('Error clearing Hive database', error, stackTrace);
    rethrow;
  }
}
