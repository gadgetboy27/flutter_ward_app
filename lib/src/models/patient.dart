class Patient {
  String? name;
  String? nhiId;
  String? notes;
  String? room;
  String? date;

  Patient({
    this.name,
    this.nhiId,
    this.notes,
    this.room,
    this.date,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'NHI': nhiId,
  //     'name': name,
  //     'room': room,
  //     'notes': notes,
  //     'date': date
  //   };
  // }

  // factory Patient.fromJson(Map<String, dynamic> parsedJson) {
  //   return Patient(
  //       date: parsedJson['date'],
  //       name: parsedJson['name'],
  //       room: parsedJson['room'],
  //       notes: parsedJson['notes'],
  //       nhiId: parsedJson['NHI']
  //   );
  // }
}
