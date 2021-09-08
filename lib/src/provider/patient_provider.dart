// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_ward_app/src/models/patient.dart';
import 'package:flutter_ward_app/src/provider/patient_list.dart';
// import 'package:flutter_ward_app/src/services/firestore_service.dart';
// import 'package:uuid/uuid.dart';

// class PatientProvider extends ChangeNotifier {
//   final firestoreService = FirestoreService();
//   String _name;
//   String _nhiId;
//   String _room;
//   String _notes;
//   String _date;
//   var uuid = Uuid();

//   //Getters
//   String get name => _name;
//   String get nhiId => _nhiId;
//   String get room => _room;
//   String get notes => _notes;

//   //Setters
//   changeName(String value) {
//     _name = value;
//     notifyListeners();
//   }

//   changeNhiId(String value) {
//     _nhiId = value;
//     notifyListeners();
//   }

//   changeRoom(String value) {
//     _room = value;
//     notifyListeners();
//   }

//   changeNotes(String value) {
//     _notes = value;
//     notifyListeners();
//   }

//   //Load details into Edit Patient
//   loadValues(Patient patient) {
//     _name = patient.name;
//     _nhiId = patient.nhiId;
//     _room = patient.room;
//     _notes = patient.notes;
//     _date = patient.date;
//   }

//   //Save Patient
//   savePatient() {
//     print(_name);
//     if (_name == null) {
//       var newPatient = Patient(
//           name: name, nhiId: nhiId, room: room, notes: notes, date: uuid.v4());
//       firestoreService.savePatient(newPatient);
//     } else {
//       //Update Patient Deets
//       var updatedPatient = Patient(
//           name: name, nhiId: nhiId, room: room, notes: notes, date: _date);
//       firestoreService.savePatient(updatedPatient);
//     }
//   }

//   removePatient(String patientId) {
//     print(name);
//     firestoreService.removePatient(nhiId);
//   }
// }

final channelNameProvider = Provider<String>(
  (_) => 'Patient Details',
);

final patientNameProvider = FutureProvider<String>(
  (_) => getPatientName(),
);

getPatientName() {}

// For info on defining the types<String><List> etc 
// Chettag coding riverpod 1 video for ref
final patientListProvider = StateNotifierProvider(
  (_) => PatientListController(),
);
