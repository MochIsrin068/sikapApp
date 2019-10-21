import 'package:charts_flutter/flutter.dart' as charts;
import 'package:sikap/models/chart_ordinal.dart';

class ChartModel {
  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> createSampleData() {
    final dataKedatangan = [
      new OrdinalSales('Jan', 312),
      new OrdinalSales('Feb', 210),
      new OrdinalSales('Mar', 299),
      new OrdinalSales('Apr', 109),
      new OrdinalSales('Mei', 74),
      new OrdinalSales('Jun', 10),
      new OrdinalSales('Jul', 99),
      new OrdinalSales('Aug', 0),
      new OrdinalSales('Sept', 0),
      new OrdinalSales('Okt', 0),
      new OrdinalSales('Nov', 0),
      new OrdinalSales('Des', 0),
    ];
    final dataKeberangkatan = [
      new OrdinalSales('Jan', 300),
      new OrdinalSales('Feb', 158),
      new OrdinalSales('Mar', 158),
      new OrdinalSales('Apr', 166),
      new OrdinalSales('Mei', 82),
      new OrdinalSales('Jun', 100),
      new OrdinalSales('Jul', 0),
      new OrdinalSales('Aug', 0),
      new OrdinalSales('Sept', 0),
      new OrdinalSales('Okt', 0),
      new OrdinalSales('Nov', 0),
      new OrdinalSales('Des', 0),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Kedatangan',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: dataKedatangan,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Keberangkatan',
        colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: dataKeberangkatan,
      )
    ];
  }
}
