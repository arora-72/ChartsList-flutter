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
    _getData();
  }



  Stream<AssessmentRecord> getData(){
    return Firestore.instance
        .collection("results")
        .snapshots()
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: FlatButton(
                  color: Colors.amber,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("get Game Record"),
                      StreamBuilder<AssessmentRecord>(
                        stream: getGame(),
                        builder: (BuildContext c, AsyncSnapshot<GameRecord> data) {
                          if (data?.data == null) return Text("Error");

                          GameRecord r = data.data;

                          return Text("${r.creationTimestamp} + ${r.name}");
                        },
                      ),
                    ],
                  ),
                  onPressed: () {
                    getGame();
                  },
                ))));
  }
}
