import 'package:flutter/material.dart';
import '../models/patient.dart';
import 'package:provider/provider.dart';
import '../provider/patient_provider.dart';

class EditPatient extends StatefulWidget {
  final Patient patient;

  EditPatient([this.patient]);

  @override
  _EditPatientState createState() => _EditPatientState();
}

class _EditPatientState extends State<EditPatient> {
  final nameController = TextEditingController();
  final nhiIdController = TextEditingController();
  final roomController = TextEditingController();
  final notesController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    nhiIdController.dispose();
    roomController.dispose();
    notesController.dispose();
    super.dispose();
  }
      //Populates edit_patient fields
  @override
  void initState() {
    if (widget.patient == null) {
      //New Record
      nameController.text = '';
      nhiIdController.text = '';
      notesController.text = '';
      roomController.text = '';
      new Future.delayed(Duration.zero, () {
        final patientProvider =
            Provider.of<PatientProvider>(context, listen: false);
        patientProvider.loadValues(Patient());
      });
    } else {
      //Controller Update
      nameController.text = widget.patient.name;
      nhiIdController.text = widget.patient.nhiId;
      roomController.text = widget.patient.room;
      notesController.text = widget.patient.notes;
      //State Update
      new Future.delayed(Duration.zero, () {
        final patientProvider =
            Provider.of<PatientProvider>(context, listen: false);
        patientProvider.loadValues(widget.patient);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final patientProvider = Provider.of<PatientProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Edit Patient')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Name'),
              onChanged: (value) => patientProvider.changeName(value),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'NHI'),
              onChanged: (value) => patientProvider.changeNhiId(value),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Room'),
              onChanged: (value) => patientProvider.changeRoom(value),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Notes'),
              onChanged: (value) => patientProvider.changeNotes(value),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text('Save'),
              onPressed: () {
                patientProvider.savePatient();
                Navigator.of(context).pop();
              },
            ),
            (widget.patient != null)
                ? RaisedButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text('Delete'),
                    onPressed: () {
                      patientProvider.removePatient(widget.patient.patientId);
                      Navigator.of(context).pop();
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
