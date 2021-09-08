import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ward_app/src/models/patient.dart';

class PatientListController extends StateNotifier<List<Patient>> {
  PatientListController() : super([]);

  addPatient(Patient patient) {
    state = [...state, patient];
  }

  deletePatient(Patient patient) {
    state = state.where((_patient) => _patient.name != patient.name).toList();
  }
}
// Working widget