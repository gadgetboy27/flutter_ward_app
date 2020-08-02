import 'package:flutter/material.dart';
import 'package:flutter_ward_app/provider/patient_provider.dart';
import 'package:flutter_ward_app/services/firestore_service.dart';
import 'package:provider/provider.dart';

import 'screens/patients.dart';
// import './models/patient.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PatientProvider()),
        StreamProvider(create: (context)=>firestoreService.getPatients()),
      ],
      child: MaterialApp(
        title: 'Patient App',
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        home: Patients(),
      ),
    );
  }
}
