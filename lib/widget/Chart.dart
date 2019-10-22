import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:sikap/models/chart_models.dart';

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData() {
    return new SimpleBarChart(
      ChartModel.createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(seriesList,
        animate: animate,
        barGroupingType: charts.BarGroupingType.grouped,
        vertical: false,
        barRendererDecorator: new charts.BarLabelDecorator(
          insideLabelStyleSpec:
              new charts.TextStyleSpec(fontSize: 6, color: charts.Color.white),
          outsideLabelStyleSpec: new charts.TextStyleSpec(fontSize: 6),
        ));
  }
}
