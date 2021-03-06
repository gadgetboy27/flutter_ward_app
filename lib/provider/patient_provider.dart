import 'package:flutter/material.dart';
import 'package:flutter_ward_app/models/patient.dart';
import 'package:flutter_ward_app/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class PatientProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _name;
  String _nhiId;
  String _room;
  String _notes;
  String _patientId;
  var uuid = Uuid();

  //Getters
  String get name => _name;
  String get nhiId => _nhiId;
  String get room => _room;
  String get notes => _notes;

  //Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changeNhiId(String value) {
    _nhiId = value;
    notifyListeners();
  }

  changeRoom(String value) {
    _room = value;
    notifyListeners();
  }

  changeNotes(String value) {
    _notes = value;
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

  //Save Patient
  savePatient() {
    print(_patientId);
    if (_patientId == null) {
      var newPatient = Patient(
          name: name, 
          nhiId: nhiId, 
          notes: _notes, 
          patientId: uuid.v4());
      firestoreService.savePatient(newPatient);
    } else {
      //Update
      var updatedPatient = Patient(
          name: name,
          nhiId: _nhiId,
          room: _room,
          notes: _notes,
          patientId: _patientId);
      firestoreService.savePatient(updatedPatient);
    }
  }

  removePatient(String patientId) {
    firestoreService.removePatient(patientId);
  }
}
