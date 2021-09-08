import 'package:flutter/material.dart';
import 'package:flutter_ward_app/widgets/patient_list.dart';

class PatientListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          'Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        child: PatientList(),
        padding: EdgeInsets.all(16.0),

      ),
    );
  }
}
