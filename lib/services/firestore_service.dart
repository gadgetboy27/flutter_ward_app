import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ward_app/models/patient.dart';

class FirestoreService {
  Firestore _db = Firestore.instance;
//Save and Edit Patient in one function
  Future<void> savePatient(Patient patient) {
    return _db
        .collection('patients')
        .document(patient.nhiId)
        .setData(patient.toMap());
  }

  Stream<List<Patient>> getPatients() {
    return _db.collection('patients').snapshots().map((snapshot) => snapshot
        .documents
        .map((document) => Patient.fromFirestore(document.data))
        .toList());
  }

  Future<void> removePatient(String patientId) {
    return _db.collection('patients').document(patientId).delete();
  }
}
