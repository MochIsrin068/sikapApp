import 'dart:convert';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class KapalProvider with ChangeNotifier {
  List _datakapal = [];

  List get datakapal => _datakapal;

  final AsyncMemoizer<String> _memoizer = AsyncMemoizer();

  Future<String> getDataKapal() async {
    return _memoizer.runOnce(() async {
      var response = await http.get(
          "https://api.ppskendari.com/kapal?api-key=b25f5f60-0072-498f-b886-fea4841de246");
      if (response.statusCode == 200) {
        var k = (json.decode(response.body) as Map<String, dynamic>)['data'];
        _datakapal = k;
        notifyListeners();
      }
      return 's';
    });
  }
}
