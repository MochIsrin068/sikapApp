import 'package:charts_flutter/flutter.dart' as charts;
import 'package:sikap/models/chart_ordinal.dart';

List<OrdinalSales> dataArrivals;
List<OrdinalSales> dataDepatures;

dataArrivalDepatures(List dataArrivalsNew, List dataDepaturesNew) {
  dataArrivals = [
    new OrdinalSales('Jan', int.parse(dataArrivalsNew[0]["Januari"])),
    new OrdinalSales('Feb', int.parse(dataArrivalsNew[0]["Februari"])),
    new OrdinalSales('Mar', int.parse(dataArrivalsNew[0]["Maret"])),
    new OrdinalSales('Apr', int.parse(dataArrivalsNew[0]["April"])),
    new OrdinalSales('Mei', int.parse(dataArrivalsNew[0]["Mei"])),
    new OrdinalSales('Jun', int.parse(dataArrivalsNew[0]["Juni"])),
    new OrdinalSales('Jul', int.parse(dataArrivalsNew[0]["Juli"])),
    new OrdinalSales('Aug', int.parse(dataArrivalsNew[0]["Agustus"])),
    new OrdinalSales('Sept', int.parse(dataArrivalsNew[0]["September"])),
    new OrdinalSales('Okt', int.parse(dataArrivalsNew[0]["Oktober"])),
    new OrdinalSales('Nov', int.parse(dataArrivalsNew[0]["November"])),
    new OrdinalSales('Des', int.parse(dataArrivalsNew[0]["Desember"])),
  ];

  dataDepatures = [
    new OrdinalSales('Jan', int.parse(dataDepaturesNew[0]["Januari"])),
    new OrdinalSales('Feb', int.parse(dataDepaturesNew[0]["Februari"])),
    new OrdinalSales('Mar', int.parse(dataDepaturesNew[0]["Maret"])),
    new OrdinalSales('Apr', int.parse(dataDepaturesNew[0]["April"])),
    new OrdinalSales('Mei', int.parse(dataDepaturesNew[0]["Mei"])),
    new OrdinalSales('Jun', int.parse(dataDepaturesNew[0]["Juni"])),
    new OrdinalSales('Jul', int.parse(dataDepaturesNew[0]["Juli"])),
    new OrdinalSales('Aug', int.parse(dataDepaturesNew[0]["Agustus"])),
    new OrdinalSales('Sept', int.parse(dataDepaturesNew[0]["September"])),
    new OrdinalSales('Okt', int.parse(dataDepaturesNew[0]["Oktober"])),
    new OrdinalSales('Nov', int.parse(dataDepaturesNew[0]["November"])),
    new OrdinalSales('Des', int.parse(dataDepaturesNew[0]["Desember"])),
  ];
}

class ChartModel {
  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> createSampleData() {
    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Kedatangan',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        labelAccessorFn: (OrdinalSales sales, _) => '${sales.sales.toString()}',
        data: dataArrivals,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Keberangkatan',
        colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: dataDepatures,
        labelAccessorFn: (OrdinalSales sales, _) => '${sales.sales.toString()}',
      )
    ];
  }
}
