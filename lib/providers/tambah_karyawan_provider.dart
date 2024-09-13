import 'package:flutter/material.dart';
import 'package:simpeg_app/models/sertifikat_model.dart';

class TambahKaryawanProvider extends ChangeNotifier {
  List<SertifikatModel> test = [
    SertifikatModel(idPegawai: 1, image: '', namaSertifikat: '')
  ];

  void tambahSertifikat() {
    test.add(SertifikatModel(idPegawai: 1, image: '', namaSertifikat: ''));
    notifyListeners();
  }

  void hapusSertifikat(int index) {
    test.removeAt(index);
    notifyListeners();
  }
}
