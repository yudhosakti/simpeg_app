import 'package:flutter/material.dart';
import 'package:simpeg_app/models/pegawai_detail_model.dart';

class DetailPegawaiProvider extends ChangeNotifier {
  PegawaiDetailModel? pegawaiDetailModel;

  void setInitialPegawai(PegawaiDetailModel newPegawai) {
    pegawaiDetailModel = newPegawai;
  }

  
}
