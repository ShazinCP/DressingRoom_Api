import 'package:dressingroom/model/model.dart';
import 'package:dressingroom/services/dressing_services.dart';
import 'package:flutter/material.dart';

class DressingProvider extends ChangeNotifier {

DressingProvider(){
  getAllDresses();
}

  bool isLoading = false;
  String error = "";

  List<DressingModel> allDresses = [];
  final DressingServices dressingServices = DressingServices();

  Future<void> getAllDresses() async {
    try {
      isLoading = true;
      error = '';
      allDresses = await dressingServices.fetchingDresses();
    } catch (e) {
      error = "Failed to Load data $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
