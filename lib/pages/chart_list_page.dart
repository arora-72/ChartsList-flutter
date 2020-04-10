import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_charts_list_view/models/chart_data_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChartListView extends StatefulWidget {
  @override
  _ChartListViewState createState() => _ChartListViewState();
}

class _ChartListViewState extends State<ChartListView> {


  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
      appBar: new AppBar(title: Text('display dataa'),),
      body: _buildBody(context),
    ),
    );
  }


  Widget _buildBody(BuildContext context) {
    // TODO: get actual snapshot from Cloud Firestore
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('results').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }



  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {

    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }


  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = AssessmentRecord.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.names),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.names.toString(),
            style: new TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                textBaseline: TextBaseline.alphabetic
            ),),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(record.marks.toString(),
              style: new TextStyle(
                  fontSize: 15.0,
                  textBaseline: TextBaseline.alphabetic
              ),),
          ),
          onTap: () => print(record),
        ),
      ),
    );
  }
}
