import 'dart:developer';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simpeg_app/providers/tambah_karyawan_provider.dart';

class TambahPegawaiPage extends StatefulWidget {
  const TambahPegawaiPage({super.key});

  @override
  State<TambahPegawaiPage> createState() => _TambahPegawaiPageState();
}

class _TambahPegawaiPageState extends State<TambahPegawaiPage> {
  List<String> ijazahTerakhir = [
    "SMA Sederajat",
    "D1",
    "D2",
    "D3",
    "D4",
    "S1",
    "S2"
  ];
  List<String> jenisKelamin = ["Laki-Laki", "Perempuan"];
  List<String> listGolonganKaryawan = [
    "2A",
    "2B",
    "2C",
    "2D",
    "3A",
    "3B",
    "3C",
    "3D",
    "4A",
    "4B"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Tambah Pegawai",
          style: GoogleFonts.nunito(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body:
          Consumer<TambahKaryawanProvider>(builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.005),
          child: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.22,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        image: provider.fileImage == null
                            ? DecorationImage(
                                opacity: 0.6,
                                image: AssetImage('assets/default_profile.jpg'),
                              )
                            : DecorationImage(
                                image: FileImage(provider.fileImage!),
                                fit: BoxFit.fill),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            bottom: MediaQuery.of(context).size.height * 0.01,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.redAccent),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                          CircleBorder()),
                                      padding: WidgetStatePropertyAll(
                                          EdgeInsets.zero)),
                                  onPressed: () async {
                                    if (await provider.takePickture()) {
                                      log("Success");
                                    } else {
                                      log("Failed");
                                    }
                                  },
                                  child: Icon(
                                    Icons.camera,
                                    color: Colors.black,
                                  )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SingleFormWidget(
                isEditable: true,
                editingController: provider.namaPegawai,
                hintText: "Masukkan Nama Pegawai",
                title: "Nama Pegawai",
              ),
              SingleFormWidget(
                isEditable: true,
                editingController: provider.OldNipPegawai,
                hintText: "Masukkan NIP Lama",
                title: "Old NIP",
              ),
              SingleFormWidget(
                isEditable: true,
                editingController: provider.NewNipPegawai,
                hintText: "Masukkan NIP Baru",
                title: "New NIP",
              ),
              SingleFormWidget(
                isEditable: true,
                editingController: provider.TempatLahirPegawai,
                hintText: "Masukkan Tempat Lahir",
                title: "Tempat Lahir",
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01),
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.005,
                      bottom: MediaQuery.of(context).size.height * 0.005),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Tanggal Lahir",
                            style: GoogleFonts.nunito(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.3),
                          child: DateTimeFormField(
                            initialValue: provider.tanggalLahir == null
                                ? null
                                : DateFormat('yyyy-MM-DD')
                                    .parse(provider.tanggalLahir!),
                            mode: DateTimeFieldPickerMode.date,
                            canClear: true,
                            onChanged: (value) {
                              if (value != null) {
                                provider.changeTanggal(value);
                                log(DateFormat('yyyy-MM-DD')
                                    .parse(provider.tanggalLahir!)
                                    .toString());
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Masukkan Tanggal Lahir",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)))),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              SingleFormWidget(
                isEditable: true,
                editingController: provider.JabatanPegawai,
                hintText: "Masukkan Jabatan",
                title: "Jabatan",
              ),
              SingleFormWidget(
                isEditable: true,
                editingController: provider.PengalamanPejabatPegawai,
                hintText: "Masukkan Pengalaman Jabatan",
                title: "Pengalaman Jabatan",
              ),
              DropDownCustomWidget(
                dataValue: provider.jenisKelamin,
                code: 1,
                provider: provider,
                data: provider.dataJenisKelamin,
                hintDataa: "Pilih Gender",
                title: "Jenis Kelamin",
              ),
              DropDownCustomWidget(
                dataValue: provider.golongan,
                code: 2,
                provider: provider,
                data: provider.dataGolongan,
                hintDataa: "Pilih Golongan",
                title: "Golongan",
              ),
              DropDownCustomWidget(
                dataValue: provider.pendidikanTerakhir,
                code: 3,
                provider: provider,
                data: provider.dataPendidikan,
                hintDataa: "Pilih Pendidikan Terakhir",
                title: "Pendidikan Terakhir",
              ),
              SingleFormWidget(
                  editingController: provider.pangkatPegawai,
                  hintText: "Pangkat Pegawai",
                  isEditable: false,
                  title: "Pangkat"),
              Container(
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(
                    maxHeight: double.infinity,
                    minHeight: MediaQuery.of(context).size.height * 0.1),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.01),
                          child: Text(
                            "Sertifikat Pegawai",
                            style: GoogleFonts.nunito(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: provider.test.length + 1,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index == provider.test.length) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      provider.tambahSertifikat();
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                          );
                        } else {
                          return CustomItemComponentWidget(
                            controller: provider.test[index].namaSertifikat,
                            code: 1,
                            index: index,
                            provider: provider,
                            hintTitle: "Masukkan Nama Sertifikat",
                            title: "Sertifikat ${index + 1}",
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(
                    maxHeight: double.infinity,
                    minHeight: MediaQuery.of(context).size.height * 0.1),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.01),
                          child: Text(
                            "Kelebihan Pegawai",
                            style: GoogleFonts.nunito(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: provider.dataKelebihan.length + 1,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index == provider.dataKelebihan.length) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      provider.tambahKelebihan();
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                          );
                        } else {
                          return CustomItemComponentWidget(
                            controller: provider.dataKelebihan[index].data,
                            code: 2,
                            index: index,
                            provider: provider,
                            hintTitle: "Masukkan Kelebihan Pegawai",
                            title: "Kelebihan ${index + 1}",
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(
                    maxHeight: double.infinity,
                    minHeight: MediaQuery.of(context).size.height * 0.1),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.01),
                          child: Text(
                            "Kekurangan Pegawai",
                            style: GoogleFonts.nunito(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: provider.dataKekurangan.length + 1,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index == provider.dataKekurangan.length) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      provider.tambahKekurangant();
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                          );
                        } else {
                          return CustomItemComponentWidget(
                            controller: provider.dataKekurangan[index].data,
                            code: 3,
                            index: index,
                            provider: provider,
                            hintTitle: "Masukkan Kekurangan Pegawai",
                            title: "Kekurangan ${index + 1}",
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(
                    maxHeight: double.infinity,
                    minHeight: MediaQuery.of(context).size.height * 0.1),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.01),
                          child: Text(
                            "Diklat Pegawai",
                            style: GoogleFonts.nunito(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: provider.dataDiklat.length + 1,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index == provider.dataDiklat.length) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      provider.tambahDiklat();
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                          );
                        } else {
                          return CustomItemComponentWidget(
                            controller: provider.dataDiklat[index].data,
                            code: 4,
                            index: index,
                            provider: provider,
                            hintTitle: "Masukkan Nama Diklat",
                            title: "Diklat ${index + 1}",
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          ),
        );
      }),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.06,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: MediaQuery.of(context).size.height * 0.005),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))))),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(
                        "Apakah Anda Yakin Ingin Menambahkan Pegawai Ini",
                        style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      title: Text(
                        "Perhatian",
                        style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.nunito(
                                  fontSize: 18,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w600),
                            )),
                        Consumer<TambahKaryawanProvider>(
                            builder: (context, provider, child) {
                          return TextButton(
                              onPressed: () {
                                if (provider.tambahPegawaiFinal()) {
                                  log("Berhasil");
                                } else {
                                  log("Gagal");
                                }
                              },
                              child: Text(
                                "Ok",
                                style: GoogleFonts.nunito(
                                    fontSize: 18,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w600),
                              ));
                        })
                      ],
                    );
                  },
                );
              },
              child: Text(
                "Tambah Pegawai",
                style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )),
        ),
      ),
    );
  }
}

class CustomItemComponentWidget extends StatelessWidget {
  final String title;
  final int code;
  final TextEditingController controller;
  final String hintTitle;
  final int index;
  final TambahKaryawanProvider provider;
  const CustomItemComponentWidget(
      {super.key,
      required this.hintTitle,
      required this.controller,
      required this.title,
      required this.code,
      required this.index,
      required this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01,
          vertical: MediaQuery.of(context).size.height * 0.005),
      child: Card(
        color: Color.fromRGBO(247, 247, 247, 1),
        elevation: 5,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.12,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.12,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: IconButton(
                      iconSize: 32,
                      onPressed: () {
                        if (code == 1) {
                          provider.hapusSertifikat(index);
                        } else if (code == 2) {
                          provider.hapusKelebihant(index);
                        } else if (code == 3) {
                          provider.hapusKekurangan(index);
                        } else {
                          provider.hapusDiklat(index);
                        }
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ),
              ),
              Expanded(
                  child: Container(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.04,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                title,
                                style: GoogleFonts.nunito(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.width * 0.15),
                            child: Container(
                              child: TextFormField(
                                controller: controller,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Masukkan Nama Sertifikat",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)))),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class DropDownCustomWidget extends StatefulWidget {
  final String title;
  final String hintDataa;
  final List<String> data;
  final String dataValue;
  final TambahKaryawanProvider provider;
  final int code;
  const DropDownCustomWidget(
      {super.key,
      required this.dataValue,
      required this.code,
      required this.data,
      required this.provider,
      required this.hintDataa,
      required this.title});

  @override
  State<DropDownCustomWidget> createState() => _DropDownCustomWidgetState();
}

class _DropDownCustomWidgetState extends State<DropDownCustomWidget> {
  String? values;
  @override
  void initState() {
    if (widget.code == 1) {
      values = widget.provider.jenisKelamin;
    } else if (widget.code == 2) {
      values = widget.provider.golongan;
    } else {
      values = widget.provider.pendidikanTerakhir;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01),
      child: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.002,
            bottom: MediaQuery.of(context).size.height * 0.002),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.04,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.title,
                  style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
                child: Container(
              child: Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3),
                child: DropdownButton(
                  value: widget.dataValue,
                  menuMaxHeight: MediaQuery.of(context).size.height * 0.15,
                  alignment: Alignment.centerLeft,
                  elevation: 10,
                  dropdownColor: const Color.fromRGBO(180, 197, 224, 1),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  isExpanded: true,
                  hint: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.005),
                    child: Text(widget.hintDataa),
                  ),
                  onChanged: (valuetest) {
                    if (widget.code == 1) {
                      widget.provider.changeGender(valuetest!);
                    } else if (widget.code == 2) {
                      widget.provider.changeGolongan(valuetest!);
                    } else {
                      widget.provider.changePendidikan(valuetest!);
                    }
                    setState(() {});
                  },
                  items:
                      widget.data.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class DoubleFieldWidget extends StatelessWidget {
  const DoubleFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.46,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.04,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Old NIP",
                        style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Masukkan NIP Lama",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)))),
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Expanded(
                child: Container(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.04,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "New NIP",
                        style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Masukkan NIP Baru",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)))),
                    ),
                  ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class SingleFormWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final bool isEditable;
  final TextEditingController editingController;
  const SingleFormWidget(
      {super.key,
      required this.editingController,
      required this.hintText,
      required this.isEditable,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01),
      child: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.002,
            bottom: MediaQuery.of(context).size.height * 0.002),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.04,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
                child: Container(
              child: Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3),
                child: TextFormField(
                  style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                  enabled: isEditable,
                  controller: editingController,
                  decoration: InputDecoration(
                      hintText: hintText,
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
