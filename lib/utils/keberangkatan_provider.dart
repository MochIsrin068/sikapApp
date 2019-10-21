import 'dart:convert';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class KeberangkatanProvider with ChangeNotifier {
  List _keberangkatan = [];

  List get keberangkatan => _keberangkatan;

  final AsyncMemoizer<String> _memoizer = AsyncMemoizer();

  Future<String> getKeberangkatan() {
    return _memoizer.runOnce(() async {
      var response = await http.get(
          "https://api.ppskendari.com/keberangkatan?api-key=b25f5f60-0072-498f-b886-fea4841de246");

      if (response.statusCode == 200) {
        var k = (json.decode(response.body) as Map<String, dynamic>)['data'];
        _keberangkatan = k;
        notifyListeners();
      }
      return 's';
    });
  }
}
