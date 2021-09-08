// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_ward_app/src/models/patient.dart';


// class FirestoreService {
//   FirebaseFirestore _db = FirebaseFirestore.instance;

//   //Get Patients
//   Stream<List<Patient>> getPatients() {
//     return _db
//         .collection('patients')
//         .snapshots()
//         .map((snapshot) => snapshot.docs
//         .map((doc) => Patient.fromJson(doc.data()))
//         .toList());
//   }

//   //Create and update Patient in one function
//   Future<void> savePatient(Patient patient) {
//     var options = SetOptions(merge:true);
//     return _db
//         .collection('patients')
//         .doc(patient.nhiId) //Puts nhiID in place of random ID in DB
//         .set(patient.toMap(), options);
//   }

//   //Delete patient
//   Future<void> removePatient(String patientId) {
//     return _db.collection('patients').doc(patientId).delete();
//   }
// }
