import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:simpeg_app/data/host_data.dart';
import 'package:simpeg_app/models/pegawai_detail_model.dart';
import 'package:simpeg_app/models/pegawai_get_model.dart';
import 'package:simpeg_app/models/pegawai_model.dart';

class PegawaiData {
  Future<int> tambahPegawai(PegawaiModel pegawai, int idAdmin) async {
    try {
      Dio dio = Dio();
      if (pegawai.foto == '') {
        FormData formData = FormData.fromMap({
          "id_admin": idAdmin,
          "oldNip": pegawai.oldNip,
          "newNip": pegawai.newNip,
          "nama": pegawai.namaPegawai,
          "jenisKelamin": pegawai.jenisKelamin,
          "tempatLahir": pegawai.tempatLahir,
          "tanggalLahir": pegawai.tanggalLahir,
          "pangkat": pegawai.pangkat,
          "golongan": pegawai.golongan,
          "pendidikan": pegawai.pendidikan,
          "jabatan": pegawai.jabatan,
          "pengalamanJabatan": pegawai.pengalamanJabatan
        });

        var response = await dio.post("${hostData}/pegawai",
            data: formData,
            options: Options(contentType: 'multipart/form-data'));
        print(response.data);
        if (response.statusCode == 200) {
          return response.data['id'];
        } else {
          return 0;
        }
      } else {
        FormData formData = FormData.fromMap({
          "image": await MultipartFile.fromFile(pegawai.foto,
              filename: pegawai.foto.split('/').last),
          "id_admin": idAdmin,
          "oldNip": pegawai.oldNip,
          "newNip": pegawai.newNip,
          "nama": pegawai.namaPegawai,
          "jenisKelamin": pegawai.jenisKelamin,
          "tempatLahir": pegawai.tempatLahir,
          "tanggalLahir": pegawai.tanggalLahir,
          "pangkat": pegawai.pangkat,
          "golongan": pegawai.golongan,
          "pendidikan": pegawai.pendidikan,
          "jabatan": pegawai.jabatan,
          "pengalamanJabatan": pegawai.pengalamanJabatan
        });

        var response = await dio.post("${hostData}/pegawai",
            data: formData,
            options: Options(contentType: 'multipart/form-data'));
        print(response.data);
        if (response.statusCode == 200) {
          return response.data['id'];
        } else {
          return 0;
        }
      }
    } catch (e) {
      return 0;
    }
  }

  Future<bool> tambahKelebihanPegawai(
      int idPegawai, int idAdmin, String kelebihan) async {
    try {
      var response = await http.post(Uri.parse('${hostData}/trait/kelebihan'),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
          },
          body: jsonEncode({
            "idPegawai": idPegawai,
            "idAdmin": idAdmin,
            "kelebihan": kelebihan
          }));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> tambahKekuranganPegawai(
      int idPegawai, int idAdmin, String kekurangan) async {
    try {
      var response = await http.post(Uri.parse('${hostData}/trait/kekurangan'),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
          },
          body: jsonEncode({
            "idPegawai": idPegawai,
            "idAdmin": idAdmin,
            "kekurangan": kekurangan
          }));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> tambahSertifikatPegawai(
      int idPegawai, int idAdmin, String sertifikat) async {
    try {
      var response = await http.post(Uri.parse('${hostData}/certificate'),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
          },
          body: jsonEncode({
            "id_pegawai": idPegawai,
            "id_admin": idAdmin,
            "nama_sertifikat": sertifikat
          }));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> tambahDiklatPegawai(
      int idPegawai, int idAdmin, String diklat) async {
    try {
      var response = await http.post(Uri.parse('${hostData}/diklat'),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
          },
          body: jsonEncode(
              {"idPegawai": idPegawai, "idAdmin": idAdmin, "diklat": diklat}));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<PegawaiGetModel>> getAllPegawai() async {
    List<PegawaiGetModel> pegawaiList = [];

    try {
      var response = await http.get(Uri.parse("${hostData}/pegawai"));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<dynamic> jsonMap = (jsonData as Map<String, dynamic>)['data'];
        for (var element in jsonMap) {
          pegawaiList.add(PegawaiGetModel.getDataFromJSON(element));
        }
        return pegawaiList;
      } else {
        return pegawaiList;
      }
    } catch (e) {
      print(e);
      return pegawaiList;
    }
  }

  Future<List<PegawaiGetModel>> getSearchPegawai(String searchName) async {
    List<PegawaiGetModel> pegawaiList = [];

    try {
      var response = await http
          .get(Uri.parse("${hostData}/pegawai/search?nama=${searchName}"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<dynamic> jsonMap = (jsonData as Map<String, dynamic>)['data'];
        for (var element in jsonMap) {
          pegawaiList.add(PegawaiGetModel.getDataFromJSON(element));
        }
        return pegawaiList;
      } else {
        return pegawaiList;
      }
    } catch (e) {
      print(e);
      return pegawaiList;
    }
  }

  Future<PegawaiDetailModel?> getDetailPegawai(int idPegawai) async {
    try {
      var response = await http
          .get(Uri.parse("${hostData}/pegawai/detail?id_pegawai=${idPegawai}"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        dynamic jsonMap = (jsonData as Map<String, dynamic>)['data'];
        PegawaiDetailModel pegawaiDetailModel =
            PegawaiDetailModel.getDataFromJSON(jsonMap);

        return pegawaiDetailModel;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> updatePegawai(PegawaiGetModel pegawai, int idAdmin) async {
    try {
      print("halo");
      var response = await http.put(Uri.parse("${hostData}/pegawai"),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
          },
          body: jsonEncode({
            "id_pegawai": pegawai.idPegawai,
            "idAdmin": idAdmin,
            "oldNip": pegawai.oldNip,
            "newNip": pegawai.newNip,
            "namaPegawai": pegawai.namaPegawai,
            "jenisKelamin": pegawai.jenisKelamin,
            "tempatLahir": pegawai.tempatLahir,
            "tanggalLahir": pegawai.tanggalLahir,
            "pangkat": pegawai.pangkat,
            "golongan": pegawai.golongan,
            "pendidikan": pegawai.pendidikan,
            "jabatan": pegawai.jabatan,
            "pengalamanJabatan": pegawai.pengalamanJabatan
          }));
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateProfilePegawaiOnly(String path, int idPegawai) async {
    try {
      Dio dio = Dio();
      FormData formData = FormData.fromMap({
        "image":
            await MultipartFile.fromFile(path, filename: path.split('/').last),
        "idPegawai": idPegawai,
      });
      var response = await dio.put("${hostData}/pegawai/profile",
          data: formData, options: Options(contentType: 'multipart/form-data'));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
