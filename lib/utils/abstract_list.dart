import 'package:demo_charts_list_view/models/chart_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildChartTitle(BuildContext context);
}


class HeadingItem implements ListItem{

  final String heading;
  static final _random = new Random();

  List<charts.Series<AssessmentRecord, String >> _seriesList;
  HeadingItem(this.heading);



  @override
  Widget buildChartTitle(BuildContext context) {
    // TODO: implement buildChartTitle
    return Container(
      height: 300.0,
      padding: EdgeInsets.all(8.0),
      child:Card(
        child: Column(
        children: <Widget>[
          Expanded(
            child: _displayChart(_createSampleData(), true),
          )
        ],
      ),
      ),
    );

  }

  static int _next(int min, int max) => min + _random.nextInt(max - min);



  @override
  Widget buildTitle(BuildContext context) {
    // TODO: implement buildTitle
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        heading,
        style: Theme.of(context).textTheme.headline,
      ),
    );
  }

  static List<charts.Series<Assessment, String>> _createSampleData() {
    
    final assessmentData = [
      
      new Assessment("A", _next(0,100)),
      new Assessment("B", _next(0,100)),
      new Assessment("C", _next(0,100)),
      new Assessment("D", _next(0,100)),
      new Assessment("E", _next(0,100)),
      new Assessment("F", _next(0,100)),
      new Assessment("G", _next(0,100)),
      new Assessment("H", _next(0,100)),

    ];

    return[

      new charts.Series(
          id: 'Assessment Marks',
          data: assessmentData,
          domainFn: (Assessment assessment, _) => assessment.name,
          measureFn: (Assessment assessment, _) => assessment.marks,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      )
    ];


  }

  charts.BarChart _displayChart(List<charts.Series> seriesList, bool animate){

    return new charts.BarChart(
      seriesList,
      animate: animate,
      vertical: true,



      primaryMeasureAxis:
      new charts.NumericAxisSpec(
        showAxisLine: true,
        renderSpec: charts.GridlineRendererSpec(
            labelStyle: new charts.TextStyleSpec(
              fontSize: 10,
              color: charts.MaterialPalette.white,

            ),
            lineStyle: charts.LineStyleSpec(
              color: charts.MaterialPalette.gray.shadeDefault,
            )),

      ),

      /// This is an OrdinalAxisSpec to match up with BarChart's default
      /// ordinal domain axis (use NumericAxisSpec or DateTimeAxisSpec for
      /// other charts).
      domainAxis: new charts.OrdinalAxisSpec(

        renderSpec: charts.GridlineRendererSpec(
            labelStyle: new charts.TextStyleSpec(
              fontSize: 10,
              color: charts.MaterialPalette.white,
            ),
            lineStyle: charts.LineStyleSpec(
              color: charts.MaterialPalette.gray.shadeDefault,
            )),
      ),


    );
  }

}