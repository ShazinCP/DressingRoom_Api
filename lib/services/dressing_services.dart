import 'dart:convert';

import 'package:dressingroom/model/model.dart';
import 'package:http/http.dart' as http;

class DressingServices {
  Future<List<DressingModel>> fetchingDresses() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<DressingModel> dress = data.map((item) => DressingModel.fromJson(item)).toList();
      return dress;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
