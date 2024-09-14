import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPegawaiPage extends StatelessWidget {
  const DetailPegawaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Pegawai",
          style: GoogleFonts.nunito(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01),
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            opacity: 0.6,
                            image: AssetImage('assets/default_profile.jpg'))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Expanded(
                      child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InformationDetailComponentWidget(
                          isEditable: true,
                          data: "Yudho Sakti Rama S.A",
                          title: "Nama Lengkap",
                        ),
                        InformationDetailComponentWidget(
                          isEditable: true,
                          data: "322567383",
                          title: "New NIP",
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3),
              child: InformationDetailComponentWidget(
                isEditable: true,
                data: "340012417",
                title: "Old NIP",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3),
              child: InformationDetailComponentWidget(
                isEditable: true,
                data: "Laki-Laki",
                title: "Jenis Kelamin",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3),
              child: InformationDetailComponentWidget(
                isEditable: true,
                data: "Madiun",
                title: "Tempat Lahir",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3),
              child: InformationDetailComponentWidget(
                isEditable: true,
                data: "23-08-2003",
                title: "Tanggal Lahir",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3),
              child: InformationDetailComponentWidget(
                isEditable: true,
                data: "3A",
                title: "Golongan",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3),
              child: InformationDetailComponentWidget(
                isEditable: false,
                data: "Penata  TK . I",
                title: "Pangkat",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3),
              child: InformationDetailComponentWidget(
                isEditable: true,
                data: "S1",
                title: "Pendidikan Terakhir",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3),
              child: InformationDetailComponentWidget(
                isEditable: true,
                data: "Staff Ahli Muda",
                title: "Jabatan",
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            CustomViewDetailPegawaiWidget(
              btnTitle: "Tambah Sertifikat",
              itemTitle: "Sertifikat",
              title: "Sertifikat Pegawai",
            ),
            CustomViewDetailPegawaiWidget(
              btnTitle: "Tambah Kelebihan",
              itemTitle: "Kelebihan",
              title: "Kelebihan Pegawai",
            ),
            CustomViewDetailPegawaiWidget(
              btnTitle: "Tambah Kekurangan",
              itemTitle: "Kekurangan",
              title: "Kekurangan Pegawai",
            ),
            CustomViewDetailPegawaiWidget(
              btnTitle: "Tambah Diklat",
              itemTitle: "Diklat",
              title: "Diklat Pegawai",
            )
          ],
        ),
      ),
    );
  }
}

class CustomViewDetailPegawaiWidget extends StatelessWidget {
  final String title;
  final String itemTitle;
  final String btnTitle;
  const CustomViewDetailPegawaiWidget(
      {super.key,
      required this.btnTitle,
      required this.title,
      required this.itemTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.005),
      child: Container(
        width: MediaQuery.of(context).size.width,
        constraints: BoxConstraints(
            maxHeight: double.infinity,
            minHeight: MediaQuery.of(context).size.height * 0.1),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.04,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.005),
                      child: Text(
                        title,
                        style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.blueAccent),
                          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.01))),
                      onPressed: () {},
                      child: Text(
                        btnTitle,
                        style: GoogleFonts.nunito(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    color: Color.fromRGBO(247, 247, 247, 1),
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.08,
                            height: MediaQuery.of(context).size.height,
                            child: Center(
                              child: IconButton(
                                  onPressed: () {},
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${itemTitle} ${index + 1}",
                                          style: GoogleFonts.nunito(
                                              color: Colors.black,
                                              fontSize: 19,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      IconButton(
                                          style: ButtonStyle(
                                              padding: WidgetStatePropertyAll(
                                                  EdgeInsets.zero)),
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.black,
                                          ))
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Sertifikat Pelatihan dan Webinar",
                                      style: GoogleFonts.nunito(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            )
          ],
        ),
      ),
    );
  }
}

class InformationDetailComponentWidget extends StatelessWidget {
  final String title;
  final bool isEditable;
  final String data;
  const InformationDetailComponentWidget(
      {super.key,
      required this.data,
      required this.title,
      required this.isEditable});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.08,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.04,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 1),
                      child: Text(
                        title,
                        style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    isEditable
                        ? IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ))
                        : Container()
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 1),
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      data,
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
