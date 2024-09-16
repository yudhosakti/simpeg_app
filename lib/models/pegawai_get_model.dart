class PegawaiGetModel {
  final int idPegawai;
  final int oldNip;
  final int newNip;
  final String namaPegawai;
  final String foto;
  final String jenisKelamin;
  final String tempatLahir;
  final String tanggalLahir;
  final String pangkat;
  final String golongan;
  final String pendidikan;
  final String jabatan;
  final String pengalamanJabatan;
  PegawaiGetModel(
      {required this.foto,
      required this.golongan,
      required this.pengalamanJabatan,
      required this.idPegawai,
      required this.jabatan,
      required this.jenisKelamin,
      required this.namaPegawai,
      required this.newNip,
      required this.oldNip,
      required this.pangkat,
      required this.pendidikan,
      required this.tanggalLahir,
      required this.tempatLahir});

  factory PegawaiGetModel.getDataFromJSON(Map<String, dynamic> json) {
    return PegawaiGetModel(
        foto: json['foto'] ?? '',
        golongan: json['golongan'] ?? '',
        idPegawai: json['id_pegawai'] ?? 0,
        jabatan: json['jabatan'] ?? '',
        jenisKelamin: json['jenis_kelamin'] ??'',
        namaPegawai: json['nama_pegawai'] ?? '',
        newNip: json['new_nip'] ?? 0,
        oldNip: json['old_nip'] ?? 0,
        pangkat: json['pangkat'] ?? '',
        pendidikan: json['pendidikan'] ?? '',
        tanggalLahir: json['tanggal_lahir'] ?? '',
        tempatLahir: json['tempat_lahir'] ?? '',
        pengalamanJabatan: json['pengalaman_jabatan'] ?? '');
  }
}
