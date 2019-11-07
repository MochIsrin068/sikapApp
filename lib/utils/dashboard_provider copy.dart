// https://api.ppskendari.com/dashboard?api-key=b25f5f60-0072-498f-b886-fea4841de246

import 'dart:convert';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class IkanProvider with ChangeNotifier {
  List _ikan = [];

  List get ikan => _ikan;

  final AsyncMemoizer<String> _memoizer = AsyncMemoizer();

  Future<String> getIkanData() async {
    return _memoizer.runOnce(() async {
      var response = await http.get(
          "https://api.ppskendari.com/ikan?api-key=b25f5f60-0072-498f-b886-fea4841de246");
      if (response.statusCode == 200) {
        var k = (json.decode(response.body) as Map<String, dynamic>)['data'];
        _ikan = k;
        notifyListeners();
      }
      return 's';
    });
  }
}
