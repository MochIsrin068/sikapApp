import 'dart:convert';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class KedatanganProvider with ChangeNotifier {
  List _kedatangan = [];

  List get kedatangan => _kedatangan;

  final AsyncMemoizer<String> _memoizer = AsyncMemoizer();

  Future<String> getKedatangan() {
    return _memoizer.runOnce(() async {
      var response = await http.get(
          "https://api.ppskendari.com/kedatangan?api-key=b25f5f60-0072-498f-b886-fea4841de246");

      if (response.statusCode == 200) {
        var k = (json.decode(response.body) as Map<String, dynamic>)['data'];
        _kedatangan = k;
        notifyListeners();
      }
      return 's';
    });
  }
}
