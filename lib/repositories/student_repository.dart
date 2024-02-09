import 'dart:developer' as dev;
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

import '../model/student_model.dart';

class StudentRepository {
  StudentRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  pickAndUploadFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      dynamic bytes;
      if (kIsWeb) {
        bytes = file.bytes;
      } else {
        bytes = File(file.path!).readAsBytesSync();
      }
      final excel = Excel.decodeBytes(bytes);
      for (var table in excel.tables.keys) {
        dev.log(table); //sheet Name
        for (var row in excel.tables[table]!.rows) {
          // Skip header row
          if (row[0].toString().toLowerCase() == 'div') continue;
          var studentMap = {
            'division': row[0]?.value?.toString() ?? '',
            'rollNo': row[1]?.value?.toString() ?? '',
            'regNo': row[2]?.value?.toString() ?? '',
            'enrollNo': row[3]?.value?.toString() ?? '',
            'studentName': row[4]?.value?.toString() ?? '',
            'studentEmail': row[5]?.value?.toString() ?? '',
            'studentMobile': row[6]?.value?.toString() ?? '',
            'fatherMobile': row[7]?.value?.toString() ?? '',
            'fatherOccupation': row[8]?.value?.toString() ?? '',
            'motherOccupation': row[9]?.value?.toString() ?? '',
            'business': row[10]?.value?.toString().toLowerCase() == 'yes',
            'typeOfBusiness1': row[11]?.value?.toString() ?? '',
            'typeOfBusiness2': row[12]?.value?.toString() ?? '',
            'city': row[13]?.value?.toString() ?? '',
            'district': row[14]?.value?.toString() ?? '',
            'job': row[15]?.value?.toString().toLowerCase() == 'yes',
            'jobCompany': row[16]?.value?.toString() ?? '',
            'jobRole': row[17]?.value?.toString() ?? '',
            'jobCity': row[18]?.value?.toString() ?? '',
            'physicallyDisable':
                row[19]?.value?.toString().toLowerCase() == 'yes',
          };
          dev.log(studentMap['division'].toString(), name: "Division Name");

          await _firestore
              .collection('students')
              .doc(row[2]!.value.toString())
              .set(studentMap);
        }
      }
    }
  }

  Future<List<Student>> applyFiltering(Student filter) async {
    final querySnapshot = await _firestore
        .collection('students')
        .where(
          'business',
          isEqualTo: filter.business,
        )
        .get();
    return querySnapshot.docs.map((e) => Student.fromMap(e.data())).toList();
  }

  Future<List<Student>> getInitialList() async {
    final querySnapshot = await _firestore.collection('students').get();
    return querySnapshot.docs.map((e) => Student.fromMap(e.data())).toList();
  }
}
