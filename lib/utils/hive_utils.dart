import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:time_table_app/models/event_model.dart';
import 'package:time_table_app/utils/constants.dart';

final Logger log = Logger();

// Open hive box
Future<Box<dynamic>> _openHiveBox() async {
  try {
    final box = await Hive.openBox(hiveDb);
    log.d('Hive opened successfully');
    return box;
  } catch (error, stackTrace) {
    log.e('Error initializing Hive', error, stackTrace);
    rethrow;
  }
}

// insert  data
Future<void> insertToLocal({required String key, required Event value}) async {
  final box = await _openHiveBox();
  box.put(key, value);

  log.d("$key: '$value'\ninserted successfully");
}

// Retrive data
Future<Event> readFromLocal({required key}) async {
  final box = await _openHiveBox();
  return box.get(key);
}
