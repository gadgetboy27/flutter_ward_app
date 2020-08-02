import 'package:flutter/material.dart';
import 'package:flutter_ward_app/models/patient.dart';
import 'package:flutter_ward_app/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class PatientProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _name;
  String _nhiId;
  String _notes;
  double _room;
  String _patientId;
  var uuid = Uuid();

  //Getters
  String get name => _name;
  String get notes => _notes;
  double get room => _room;
  String get nhiId => _nhiId;

  //Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changeRoom(String value) {
    _room = double.parse(value);
    notifyListeners();
  }

  changeNotes(String value) {
    _notes = value;
    notifyListeners();
  }

  changeNhiId(String value) {
    _nhiId = value;
    notifyListeners();
  }
    //Load details into Edit Patient
  loadValues(Patient patient) {
    _name = patient.name;
    _nhiId = patient.nhiId;
    _room = patient.room;
    _notes = patient.notes;
    _patientId = patient.patientId;
  }
    //
  savePatient() {
    print(_patientId);
    if (_patientId == null) {
      var newPatient = Patient(
          name: name,
          room: room,
          notes: notes,
          nhiId: nhiId,
          patientId: uuid.v4());
      firestoreService.savePatient(newPatient);
    } else {
      //Update Patient Deets
      var upDatedPatient = Patient(
          name: name,
          nhiId: nhiId,
          room: room,
          notes: notes,
          patientId: _patientId);
      firestoreService.savePatient(upDatedPatient);
    }
  }

  removePatient(String patientId) {
    firestoreService.removePatient(patientId);
  }
}
