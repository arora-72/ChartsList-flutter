import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_charts_list_view/models/chart_data_model.dart';
import 'package:demo_charts_list_view/utils/abstract_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartListView extends StatefulWidget {
  @override
  _ChartListViewState createState() => _ChartListViewState();
  final List<ListItem> items;
  ChartListView({Key key, @required this.items}) : super(key: key);
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
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(24, 24, 24, 1.0),
        canvasColor: Color.fromRGBO(46, 49, 49, 1.0),
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: new AppBar(
          title: Text('Charts in List View'),
        ),
        body: _buildList(context),
      ),
    );
  }


  Widget _buildList(BuildContext context) {
    return ListView.separated(
      itemCount: widget.items.length,
      separatorBuilder: (BuildContext context, int index) => Divider(
        thickness: 2.0,
      ),
      itemBuilder: (context, index) {
        final item = widget.items[index];
        return ListTile(
          title: item.buildTitle(context),
          subtitle: item.buildChartTitle(context),
        );
      },
    );
  }


}
