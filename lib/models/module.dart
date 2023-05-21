import 'package:time_table_app/models/semester.dart';

class Module {
  final Map<Semester, dynamic> _modules = {
    Semester.y2s2: {
      'IT2070': 'DSA',
      'IT2100': 'ESD',
      'IT2080': 'ITP',
      'IT2010': 'MAD',
      'IT2110': 'P&S',
      'IT2090': 'PS',
    }
  };

  Map<String, String> _getModules(Semester semester) => _modules[semester];

  String find(String semester, String moduleCode) {
    var moduleName = '';
    if (semester == 'y1s1') {
      moduleName = Module()._getModules(Semester.y1s1)[moduleCode]!;
    } else if (semester == 'y1s2') {
      moduleName = Module()._getModules(Semester.y1s2)[moduleCode]!;
    } else if (semester == 'y2s1') {
      moduleName = Module()._getModules(Semester.y2s1)[moduleCode]!;
    } else if (semester == 'y2s2') {
      moduleName = Module()._getModules(Semester.y2s2)[moduleCode]!;
    } else if (semester == 'y3s1') {
      moduleName = Module()._getModules(Semester.y3s1)[moduleCode]!;
    } else if (semester == 'y3s2') {
      moduleName = Module()._getModules(Semester.y2s1)[moduleCode]!;
    } else if (semester == 'y3s2') {
      moduleName = Module()._getModules(Semester.y2s1)[moduleCode]!;
    } else if (semester == 'y4s1') {
      moduleName = Module()._getModules(Semester.y4s1)[moduleCode]!;
    } else if (semester == 'y4s2') {
      moduleName = Module()._getModules(Semester.y4s2)[moduleCode]!;
    }
    return moduleName;
  }
}
