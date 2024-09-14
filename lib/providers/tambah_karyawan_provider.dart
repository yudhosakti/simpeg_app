import 'package:flutter/material.dart';
import 'package:simpeg_app/models/kelebihan_model.dart';
import 'package:simpeg_app/models/pangkat_golongan.dart';
import 'package:simpeg_app/models/sertifikat_model.dart';

class TambahKaryawanProvider extends ChangeNotifier {
  List<SertifikatModel> test = [
    SertifikatModel(
        idPegawai: 1, image: '', namaSertifikat: TextEditingController())
  ];

  List<DataCustomModel> dataKelebihan = [
    DataCustomModel(data: TextEditingController(), idPegawai: 1)
  ];
  List<DataCustomModel> dataKekurangan = [
    DataCustomModel(data: TextEditingController(), idPegawai: 1)
  ];
  List<DataCustomModel> dataDiklat = [
    DataCustomModel(data: TextEditingController(), idPegawai: 1)
  ];

  List<PangkatGolongan> pangkatGolongan = [
    PangkatGolongan(golongan: "2A", pangkat: "Pengatur Muda"),
    PangkatGolongan(golongan: "2B", pangkat: "Pengatur Muda Tingkat 1"),
    PangkatGolongan(golongan: "2C", pangkat: "Pengatur"),
    PangkatGolongan(golongan: "2D", pangkat: "Pengatur Tingkat 1"),
    PangkatGolongan(golongan: "3A", pangkat: "Penata Muda"),
    PangkatGolongan(golongan: "3B", pangkat: "Penata Muda Tingkat 1"),
    PangkatGolongan(golongan: "3C", pangkat: "Penata"),
    PangkatGolongan(golongan: "3D", pangkat: "Penata Tingkat 1"),
    PangkatGolongan(golongan: "4A", pangkat: "Pembina"),
    PangkatGolongan(golongan: "4B", pangkat: "Pembina Tingkat 1"),
    PangkatGolongan(golongan: "4C", pangkat: "Pembina Utama Muda"),
    PangkatGolongan(golongan: "4D", pangkat: "Pembina Utama Madya"),
    PangkatGolongan(golongan: "4E", pangkat: "Pembina Utama")
  ];

  TextEditingController namaPegawai = TextEditingController();
  TextEditingController OldNipPegawai = TextEditingController();

  TextEditingController NewNipPegawai = TextEditingController();

  TextEditingController TempatLahirPegawai = TextEditingController();
  String? tanggalLahir;
  String jenisKelamin = "Laki-Laki";
  String pickedGender = '';
  String golongan = "3A";
  String pickedPangkat = '';
  String pendidikanTerakhir = "S1";
  TextEditingController JabatanPegawai = TextEditingController();
  TextEditingController PengalamanPejabatPegawai = TextEditingController();
  Map<String, dynamic>? data;

  bool tambahPegawaiFinal() {
    if (validate()) {
      if (jenisKelamin == "Laki-Laki") {
        pickedGender = 'L';
      } else {
        pickedGender = 'P';
      }
      data = {
        "nama": namaPegawai.text,
        "oldNip": OldNipPegawai.text,
        "newNip": NewNipPegawai.text,
        "tempatLahir": TempatLahirPegawai.text,
        "tanggal_lahir": tanggalLahir,
        "jenis_kelamin": jenisKelamin,
        "gender": pickedGender,
        "pendidikan": pendidikanTerakhir,
        "jabatan": JabatanPegawai.text,
        "pengalamanPejabata": PengalamanPejabatPegawai,
        "sertifikar": test.toString(),
        "kelebihan": dataKelebihan.toString(),
        "kekurangan": dataKekurangan.toString(),
        "diklat": dataDiklat.toString()
      };
      print(data);
      return true;
    } else {
      return false;
    }
  }

  void changeGender(String newGender) {
    jenisKelamin = newGender;
    notifyListeners();
  }

  void changeGolongan(String newGolongan) {
    golongan = newGolongan;
    for (var element in pangkatGolongan) {
      if (golongan == element.golongan) {
        pickedPangkat = element.pangkat;
        break;
      }
    }
    notifyListeners();
  }

  void changePendidikan(String newPendidikan) {
    pendidikanTerakhir = newPendidikan;
    notifyListeners();
  }

  bool validate() {
    for (var element in test) {
      if (element.namaSertifikat.text.isEmpty) {
        return false;
      }
    }
    for (var element in dataKelebihan) {
      if (element.data.text.isEmpty) {
        return false;
      }
    }
    for (var element in dataKekurangan) {
      if (element.data.text.isEmpty) {
        return false;
      }
    }
    for (var element in dataDiklat) {
      if (element.data.text.isEmpty) {
        return false;
      }
    }
    if (tanggalLahir == null) {
      return false;
    }
    return true;
  }

  void tambahSertifikat() {
    test.add(SertifikatModel(
        idPegawai: 1, image: '', namaSertifikat: TextEditingController()));
    notifyListeners();
  }

  void hapusSertifikat(int index) {
    test.removeAt(index);
    notifyListeners();
  }

  void tambahKelebihan() {
    dataKelebihan
        .add(DataCustomModel(data: TextEditingController(), idPegawai: 1));
    notifyListeners();
  }

  void hapusKelebihant(int index) {
    dataKelebihan.removeAt(index);
    notifyListeners();
  }

  void tambahKekurangant() {
    dataKekurangan
        .add(DataCustomModel(data: TextEditingController(), idPegawai: 1));
    notifyListeners();
  }

  void hapusKekurangan(int index) {
    dataKekurangan.removeAt(index);
    notifyListeners();
  }

  void tambahDiklat() {
    dataDiklat
        .add(DataCustomModel(data: TextEditingController(), idPegawai: 1));
    notifyListeners();
  }

  void hapusDiklat(int index) {
    dataDiklat.removeAt(index);
    notifyListeners();
  }
}
