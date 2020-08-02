import 'package:flutter/material.dart';
import 'package:flutter_ward_app/models/patient.dart';
import 'package:provider/provider.dart';
import 'edit_patient.dart';

class Patients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final patients = Provider.of<List<Patient>>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Patient List'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditPatient(),
                  ),
                );
              },
            )
          ],
        ),
        body: (patients != null)
            ? ListView.builder(
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(patients[index].name),
                    trailing: Text(patients[index].nhiId.toString()),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditPatient(patients[index])));
                    },
                  );
                })
            : Center(child: CircularProgressIndicator())
          );
  }
}
