import 'dart:convert';

import 'package:betacov/models/IndonesiaModel.dart';
import 'package:betacov/services/ApiService.dart';
import 'package:flutter/material.dart';

class IndonesiaProvider with ChangeNotifier {
  var api = ApiServices();
  IndonesiaModel indonesia;

  Future<IndonesiaModel> getIndonesiaProvider() async {
    final response = await api.client.get("${api.indonesiaUrl}/api/summary");
    final result = json.decode(response.body) as Map<String, dynamic>;

    notifyListeners();

    indonesia = IndonesiaModel(
      confirmed: result['confirmed']['value'],
      recovered: result['recovered']['value'],
      deaths: result['deaths']['value'],
      lastupdate: DateTime.parse(result['metadata']['lastUpdatedAt']).toLocal(),
    );

    return indonesia;
  }
}
