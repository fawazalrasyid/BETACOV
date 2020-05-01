import 'dart:convert';

import 'package:betacov/models/BengkuluModel.dart';
import 'package:betacov/services/ApiService.dart';
import 'package:flutter/material.dart';

class BengkuluProvider with ChangeNotifier {
  var api = ApiServices();
  BengkuluModel bengkulu;

  Future<BengkuluModel> getBengkuluProvider() async {
    final response = await api.client.get("${api.bengkuluUrl}");
    final result = json.decode(response.body) as Map<String, dynamic>;

    notifyListeners();

    bengkulu = BengkuluModel(
        confirmed: result['confirmed']['value'],
        recovered: result['recovered']['value'],
        deaths: result['deaths']['value'],
        pdp: result['pdp']['value'],
        odp: result['odp']['value'],
        lastupdate: DateTime.parse(
            result['metadata']['lastUpdatedAt'] + "T18:00:00+07:00"));

    return bengkulu;
  }
}
