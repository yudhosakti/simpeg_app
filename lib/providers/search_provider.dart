import 'package:flutter/material.dart';
import 'package:simpeg_app/data/pegawai_data.dart';
import 'package:simpeg_app/models/pegawai_get_model.dart';

class SearchProvider extends ChangeNotifier {
  List<PegawaiGetModel> pegawaiList = [];

  TextEditingController etSearch = TextEditingController();

  bool isLoading = false;

  void getInitialPegawai(List<PegawaiGetModel> pegawai) {
    pegawaiList = pegawai;
  }

  Future<bool> getSearchPegawai() async {
    isLoading = true;
    notifyListeners();
    if (etSearch.text.isNotEmpty) {
      pegawaiList = await PegawaiData().getSearchPegawai(etSearch.text);
      isLoading = false;
      notifyListeners();
      return true;
    } else {
      pegawaiList = await PegawaiData().getAllPegawai();
      isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
