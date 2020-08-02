
class Patient {
  final String name;
  final String nhiId;
  final String notes;
  final double room;
  final String patientId;

  Patient({this.name, this.nhiId, this.notes, this.room, this.patientId});

  Map<String, dynamic> toMap() {
    return {
      'NHI': nhiId,
      'name': name,
      'room': room,
      'notes': notes,
      'patientId': patientId
    };
  }

  Patient.fromFirestore(Map<String, dynamic> firestore)
      : patientId = firestore['patientId'],
        name = firestore['name'],
        room = firestore['room'],
        notes = firestore['notes'],
        nhiId = firestore['NHI'];
}
