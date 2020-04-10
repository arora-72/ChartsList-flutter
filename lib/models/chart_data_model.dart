import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AssessmentRecord{


  final String assessmentTitle;
  final List<String> names;
  final List<String> marks;
  final DocumentReference documentReference;

  AssessmentRecord.fromMap(Map<String, dynamic>data, {this.documentReference})
  :
    assessmentTitle = data['title'],
    names = new List<String>.from(data['names']),
    marks = new List<String>.from(data['marks']);

  AssessmentRecord.fromSnapshot(DocumentSnapshot snapshot):
      this.fromMap(snapshot.data, documentReference: snapshot.reference);

  String toString() => "Record<$names:$marks>";

  }
  
