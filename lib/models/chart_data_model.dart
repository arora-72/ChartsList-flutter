// import 'package:firebase_database/firebase_database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


class AssessmentRecord{


   String assessmentTitle;
   List<String> names;
   List<int> marks;
  // final DocumentReference documentReference;

 

  // AssessmentRecord.fromMap(Map<String, dynamic>data, {this.documentReference})
  // :
  //   assessmentTitle = data['title'],
  //   names = new List<String>.from(data['names']),
  //   marks = new List<int>.from(data['marks']);

  // AssessmentRecord.fromSnapshot(DocumentSnapshot snapshot):
  //     this.fromMap(snapshot.data, documentReference: snapshot.reference);

  // String toString() => "Record<$names:$marks>";

  }
  


  class Assessment{

  final String name;
  final int marks;

  Assessment(this.name, this.marks);


  }