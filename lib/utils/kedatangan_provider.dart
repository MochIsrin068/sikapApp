import 'dart:convert';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class KedatanganProvider with ChangeNotifier {
  List _arrival = [];
  List get arrival => _arrival;

  final AsyncMemoizer<String> _memoizer = AsyncMemoizer();

  Future<String> getKedatangan() {
    return _memoizer.runOnce(() async {
      var response2 = await http.get(
          "https://api.ppskendari.com/grafik_kedatangan?api-key=b25f5f60-0072-498f-b886-fea4841de246");

      if (response2.statusCode == 200) {
        var k2 = (json.decode(response2.body) as Map<String, dynamic>)['data'];
        _arrival = k2;
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
