import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ward_app/src/provider/patient_list.dart';
import 'package:flutter_ward_app/src/provider/patient_provider.dart';

class PatientList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('patient list rebuilding...');
    return Consumer(builder: (context, watch, child) {
      final patientList = watch(patientListProvider);
      return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, int index) => Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NHI: ${patientList[index].nhiId} ',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      'Name: ${patientList[index].name} ',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      'Room: ${patientList[index].room} ',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      'Notes: ${patientList[index].notes} ',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    PatientListController controller =
                        context.read(patientListProvider.notifier);
                    controller.deletePatient(patientList[index]);
                  },
                )
              ],
            ),
          ),
        ),
        itemCount: patientList.length,
      );
    });
  }
}
