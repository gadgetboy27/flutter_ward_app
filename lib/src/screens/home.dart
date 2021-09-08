import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ward_app/src/models/patient.dart';
import 'package:flutter_ward_app/src/provider/patient_list.dart';
import 'package:flutter_ward_app/src/provider/patient_provider.dart';
import 'package:flutter_ward_app/src/screens/patient_list.dart';
import 'package:flutter_ward_app/widgets/patient_list.dart';
import 'package:flutter_ward_app/widgets/super_button.dart';
import 'package:flutter_ward_app/widgets/text_input.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? name;
  String? nhiId;
  String? room;
  String? notes;

  getPatientName() {}

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print('home building...');
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Consumer(
          builder: (context, watch, child) {
            AsyncValue<String> name = watch(patientNameProvider);
            return name.when(
              data: (name) => Text( 
                name,
                style: TextStyle(color: Colors.white),
              ),
              loading: () => Text(
                'loading...',
                style: TextStyle(color: Colors.white),
              ),
              error: (e, stackTrace) => Text('Something went wrong!'),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                context.read(channelNameProvider),
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextInput(
                labelText: 'Name ',
                onSaved: (String? value) {
                  nhiId = value;
                },
              ),
              // Make sure value is set in curly braces to show deets on screen
              SizedBox(height: 16),
              TextInput(
                labelText: 'NHI ',
                onSaved: (String? value) {
                  name = value;
                },
              ),
              SizedBox(height: 16.0),
              TextInput(
                labelText: 'Room ',
                onSaved: (String? value) {
                  room = value;
                },
              ),
              SizedBox(height: 16.0),
              TextInput(
                labelText: 'Notes ',
                onSaved: (String? value) {
                  notes = value;
                },
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer(
                    builder: (context, watch, _) {
                      final PatientListController controller =
                          context.read(patientListProvider.notifier);

                      return SuperButton(
                        text: 'Add',
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) return;

                          _formKey.currentState!.save();

                          controller.addPatient(Patient(
                              name: name,
                              nhiId: nhiId,
                              room: room,
                              notes: notes));
                        },
                      );
                    },
                  ),
                  SizedBox(width: 8),
                  SuperButton(
                    text: 'List',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatientListScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              PatientList(),
            ],
          ),
        ),
      ),
    );
  }
}
