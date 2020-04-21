import 'dart:convert';

import 'package:betacov/models/BengkuluModel.dart';
import 'package:betacov/services/ApiService.dart';
import 'package:flutter/material.dart';

class BengkuluProvider with ChangeNotifier {
  var api = ApiServices();
  BengkuluModel bengkulu;

  Future<BengkuluModel> getBengkuluProvider() async {
    final response = await api.client.get("${api.bengkuluUrl}");
    final resultBengkulu = json.decode(response.body) as Map<String, dynamic>;

    notifyListeners();

    bengkulu = BengkuluModel(
        confirmed: resultBengkulu['confirmed']['value'],
        recovered: resultBengkulu['recovered']['value'],
        deaths: resultBengkulu['deaths']['value'],
        pdp: resultBengkulu['pdp']['value'],
        odp: resultBengkulu['odp']['value'],
        lastupdate: resultBengkulu['metadata']['lastUpdatedAt']);

    return bengkulu;
  }
}
