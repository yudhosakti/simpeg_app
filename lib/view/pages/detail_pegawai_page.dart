import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simpeg_app/data/pegawai_data.dart';
import 'package:simpeg_app/providers/detail_pegawai_provider.dart';

class DetailPegawaiPage extends StatelessWidget {
  final int idPegawai;
  const DetailPegawaiPage({super.key, required this.idPegawai});

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
      body: FutureBuilder(
          future: PegawaiData().getDetailPegawai(idPegawai),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data == null) {
              return Center(
                child: Text(
                  "Data Not Found",
                  style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 23),
                ),
              );
            } else {
              context
                  .read<DetailPegawaiProvider>()
                  .setInitialPegawai(snapshot.data!);
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01),
                child: Consumer<DetailPegawaiProvider>(
                    builder: (context, provider, child) {
                  if (provider.pegawaiDetailModel == null) {
                    return Center(
                      child: Text(
                        "Data Not Found",
                        style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 23),
                      ),
                    );
                  } else {
                    return ListView(
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
                                    image: provider.pegawaiDetailModel!.foto ==
                                            ''
                                        ? DecorationImage(
                                            opacity: 0.6,
                                            image: AssetImage(
                                                'assets/default_profile.jpg'))
                                        : DecorationImage(
                                            image: NetworkImage(provider
                                                .pegawaiDetailModel!.foto),
                                            fit: BoxFit.fill)),
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
                                      data: provider
                                          .pegawaiDetailModel!.namaPegawai,
                                      title: "Nama Lengkap",
                                    ),
                                    InformationDetailComponentWidget(
                                      isEditable: true,
                                      data: provider.pegawaiDetailModel!.newNip
                                          .toString(),
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
                            data:
                                provider.pegawaiDetailModel!.oldNip.toString(),
                            title: "Old NIP",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.3),
                          child: InformationDetailComponentWidget(
                            isEditable: true,
                            data:
                                provider.pegawaiDetailModel!.jenisKelamin == 'P'
                                    ? 'Perempuan'
                                    : 'Laki-Laki',
                            title: "Jenis Kelamin",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.3),
                          child: InformationDetailComponentWidget(
                            isEditable: true,
                            data: provider.pegawaiDetailModel!.tempatLahir,
                            title: "Tempat Lahir",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.3),
                          child: InformationDetailComponentWidget(
                            isEditable: true,
                            data: provider.pegawaiDetailModel!.tanggalLahir,
                            title: "Tanggal Lahir",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.3),
                          child: InformationDetailComponentWidget(
                            isEditable: true,
                            data: provider.pegawaiDetailModel!.golongan,
                            title: "Golongan",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.3),
                          child: InformationDetailComponentWidget(
                            isEditable: false,
                            data: provider.pegawaiDetailModel!.pangkat,
                            title: "Pangkat",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.3),
                          child: InformationDetailComponentWidget(
                            isEditable: true,
                            data: provider.pegawaiDetailModel!.pendidikan,
                            title: "Pendidikan Terakhir",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.3),
                          child: InformationDetailComponentWidget(
                            isEditable: true,
                            data: provider.pegawaiDetailModel!.jabatan,
                            title: "Jabatan",
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        CustomViewDetailPegawaiWidget(
                          code: 1,
                          btnTitle: "Tambah Sertifikat",
                          itemTitle: "Sertifikat",
                          title: "Sertifikat Pegawai",
                        ),
                        CustomViewDetailPegawaiWidget(
                          code: 2,
                          btnTitle: "Tambah Kelebihan",
                          itemTitle: "Kelebihan",
                          title: "Kelebihan Pegawai",
                        ),
                        CustomViewDetailPegawaiWidget(
                          code: 3,
                          btnTitle: "Tambah Kekurangan",
                          itemTitle: "Kekurangan",
                          title: "Kekurangan Pegawai",
                        ),
                        CustomViewDetailPegawaiWidget(
                          code: 4,
                          btnTitle: "Tambah Diklat",
                          itemTitle: "Diklat",
                          title: "Diklat Pegawai",
                        )
                      ],
                    );
                  }
                }),
              );
            }
          }),
    );
  }
}

class CustomViewDetailPegawaiWidget extends StatelessWidget {
  final String title;
  final String itemTitle;
  final int code;
  final String btnTitle;
  const CustomViewDetailPegawaiWidget(
      {super.key,
      required this.code,
      required this.btnTitle,
      required this.title,
      required this.itemTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.005),
      child:
          Consumer<DetailPegawaiProvider>(builder: (context, provider, child) {
        return Container(
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
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)))),
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blueAccent),
                            padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.01))),
                        onPressed: () {},
                        child: Text(
                          btnTitle,
                          style: GoogleFonts.nunito(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ),
              Builder(builder: (context) {
                if (code == 1) {
                  if (provider.pegawaiDetailModel!.certificates.isEmpty) {
                    return NoDataWidget();
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          provider.pegawaiDetailModel!.certificates.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ItemDetailComponentWidget(
                          itemTitle: itemTitle,
                          index: index,
                          data: provider.pegawaiDetailModel!.certificates[index]
                              .namaSertifikat,
                        );
                      },
                    );
                  }
                } else if (code == 2) {
                  if (provider.pegawaiDetailModel!.kelebihan.isEmpty) {
                    return NoDataWidget();
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.pegawaiDetailModel!.kelebihan.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ItemDetailComponentWidget(
                          itemTitle: itemTitle,
                          index: index,
                          data: provider
                              .pegawaiDetailModel!.kelebihan[index].kelebihan,
                        );
                      },
                    );
                  }
                } else if (code == 3) {
                  if (provider.pegawaiDetailModel!.kekurangan.isEmpty) {
                    return NoDataWidget();
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.pegawaiDetailModel!.kekurangan.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ItemDetailComponentWidget(
                          itemTitle: itemTitle,
                          index: index,
                          data: provider
                              .pegawaiDetailModel!.kekurangan[index].kekurangan,
                        );
                      },
                    );
                  }
                } else {
                  if (provider.pegawaiDetailModel!.diklat.isEmpty) {
                    return NoDataWidget();
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.pegawaiDetailModel!.diklat.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ItemDetailComponentWidget(
                          itemTitle: itemTitle,
                          index: index,
                          data:
                              provider.pegawaiDetailModel!.diklat[index].diklat,
                        );
                      },
                    );
                  }
                }
              }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              )
            ],
          ),
        );
      }),
    );
  }
}

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.12,
      child: Center(
        child: Text("No Data Yet"),
      ),
    );
  }
}

class ItemDetailComponentWidget extends StatelessWidget {
  const ItemDetailComponentWidget({
    super.key,
    required this.data,
    required this.index,
    required this.itemTitle,
  });
  final int index;
  final String data;
  final String itemTitle;

  @override
  Widget build(BuildContext context) {
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
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  padding:
                                      WidgetStatePropertyAll(EdgeInsets.zero)),
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
                          data,
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
