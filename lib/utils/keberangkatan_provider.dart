import 'dart:convert';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class KeberangkatanProvider with ChangeNotifier {
  List _depatures = [];
  List get depatures => _depatures;

  final AsyncMemoizer<String> _memoizer = AsyncMemoizer();

  Future<String> getKeberangkatan() {
    return _memoizer.runOnce(() async {
      var response2 = await http.get(
          "https://api.ppskendari.com/grafik_keberangkatan?api-key=b25f5f60-0072-498f-b886-fea4841de246");
      if (response2.statusCode == 200) {
        var k2 = (json.decode(response2.body) as Map<String, dynamic>)['data'];
        _depatures = k2;
        notifyListeners();
      }
      return 's';
    });
  }

  List dataBulan = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember"
  ];
}
