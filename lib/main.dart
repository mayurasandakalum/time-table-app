import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:logger/logger.dart';
import 'package:time_table_app/models/event_model.dart';
import 'package:time_table_app/models/module.dart';
import 'package:time_table_app/utils/constants.dart';
import 'package:time_table_app/utils/hive_utils.dart';
import 'package:time_table_app/utils/combine_time_with_today.dart';
import 'firebase_options.dart';

final log = Logger();

void main() async {
  // initializes the binding for the Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).whenComplete(() => log.i('Firebase initialization completed successfully'));

  // initialize hive db
  await Hive.initFlutter()
      .whenComplete(() => log.i('Hive initialization completed successfully'))
      .catchError((error, stackTrace) {
    log.e('Error initializing Hive', error, stackTrace);
    return error;
  });

  Hive.registerAdapter(EventAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Event name;
  late Map<String, dynamic> event;

  final CollectionReference _timeData =
      FirebaseFirestore.instance.collection(firebaseCollection);

  void storeJsonData(BuildContext context) async {
    final jsonFile =
        await rootBundle.loadString('assets/json/schedule_data.json');
    final jsonData = json.decode(jsonFile);

    await _timeData.add(jsonData).whenComplete(
        () => log.d("JSON data successfully stored in Firestore"));
  }

  void _loadLocalData() async {
    final data = await readFromLocal(key: "name");
    setState(() => name = data);
  }

  void _loadCloudData() async {
    var querySnapshot = await _timeData.get();
    if (querySnapshot.docs.isNotEmpty) {
      var document = querySnapshot.docs.first;
      var data = document.data();
      log.v(data);
    }
  }

  @override
  void initState() {
    super.initState();
    // _loadLocalData();
    // _loadCloudData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text("Store data"),
        // onPressed: () => storeJsonData(context),
        // onPressed: () => print(name),
        onPressed: () {
          _timeData.get().then((querySnapshot) {
            if (querySnapshot.docs.isNotEmpty) {
              var document = querySnapshot.docs.first;
              var data = document.data();
              // log.v(data);

              final List<Event> eventsForADay = [];
              final Map<String, List<Event>> eventsForAGroup = {};

              (data as Map<String, dynamic>).forEach((semester, values) {
                for (var value in (values as List)) {
                  (value as Map<String, dynamic>).forEach((group, values) {
                    (values as Map<String, dynamic>).forEach((day, values) {
                      for (var event in (values as List)) {
                        // log.v((event));
                        // eventsForADay.add(Event(
                        //   from: combineTimeWithToday(event["from"]),
                        //   to: combineTimeWithToday(event["to"]),
                        //   moduleCode: event["moduleCode"],
                        //   moduleName:
                        //       Module().find(semester, event["moduleCode"]),
                        //   title: event["title"],
                        //   building: event["building"],
                        //   floor: event["floor"],
                        //   hallNumber: event["hallNumber"],
                        //   instructorName: event["instructorName"],
                        //   backgroundColorValue:
                        //       const Color.fromARGB(255, 0, 255, 0).value,
                        // ));

                        if (day == "tuesday") {
                          log.v(event);
                        }
                      }
                      // eventsForAGroup[day] = eventsForADay;
                      // eventsForADay.clear();
                    });
                  });
                }
              });
              log.v(eventsForAGroup);
            }
          });
        },
      ),
    );
  }
}
