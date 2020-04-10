import 'package:demo_charts_list_view/pages/chart_list_page.dart';
import 'package:demo_charts_list_view/utils/abstract_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(24, 24, 24, 1.0),
        canvasColor: Color.fromRGBO(46, 49, 49, 1.0),
        brightness: Brightness.dark,
      ),
      home: ChartListView(
        items: List<ListItem>.generate(5,
              (i) => HeadingItem("Assignment $i"),
        ),
      ),
    );
  }
}