import 'dart:convert';

import 'package:http/http.dart' as http;

Future getDataArrivals() async {
  var req = await http.get(
      "https://api.ppskendari.com/grafik_kedatangan?api-key=b25f5f60-0072-498f-b886-fea4841de246");
  var res = json.decode(req.body);
  return res;
}

Future getDataDepatures() async {
  var req = await http.get(
      "https://api.ppskendari.com/grafik_keberangkatan?api-key=b25f5f60-0072-498f-b886-fea4841de246");
  var res = json.decode(req.body);
  return res;
}
