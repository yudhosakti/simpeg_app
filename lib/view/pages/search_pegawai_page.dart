import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simpeg_app/data/pegawai_data.dart';
import 'package:simpeg_app/providers/search_provider.dart';
import 'package:simpeg_app/view/pages/detail_pegawai_page.dart';

class SearchPegawaiPage extends StatelessWidget {
  const SearchPegawaiPage({super.key});

  double getWidth() {
    FlutterView view = PlatformDispatcher.instance.views.first;

    double physicalWidth = view.physicalSize.width;

    double devicePixelRatio = view.devicePixelRatio;

    double screenWidth = physicalWidth / devicePixelRatio;
    return screenWidth;
  }

  double getHeight() {
    FlutterView view = PlatformDispatcher.instance.views.first;
    double physicalHeight = view.physicalSize.height;

    double devicePixelRatio = view.devicePixelRatio;
    double screenHeight = physicalHeight / devicePixelRatio;
    return screenHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Cari Pegawai",
          style: GoogleFonts.nunito(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
          future: PegawaiData().getAllPegawai(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.data != null) {
                context
                    .read<SearchProvider>()
                    .getInitialPegawai(snapshot.data!);
              }
              return ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getWidth() * 0.01,
                        vertical: getHeight() * 0.005),
                    child: Container(
                      width: getWidth(),
                      height: getHeight() * 0.08,
                      child: Consumer<SearchProvider>(
                          builder: (context, provider, child) {
                        return TextFormField(
                          controller: provider.etSearch,
                          onEditingComplete: () async {
                            if (await provider.getSearchPegawai()) {
                              Fluttertoast.showToast(msg: "Success");
                            } else {
                              Fluttertoast.showToast(msg: "Cancel");
                            }
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              hintText: "Cari Pegawai",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                        );
                      }),
                    ),
                  ),
                  Consumer<SearchProvider>(builder: (context, provider, child) {
                    if (provider.isLoading) {
                      return Container(
                        width: getWidth(),
                        height: getHeight() * 0.2,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (provider.pegawaiList.isEmpty) {
                      return Container(
                        width: getWidth(),
                        height: getHeight() * 0.2,
                        child: Center(
                          child: Text(
                            "Data Not Found",
                            style: GoogleFonts.nunito(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: provider.pegawaiList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getWidth() * 0.01,
                                vertical: getHeight() * 0.002),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPegawaiPage(
                                          idPegawai: provider
                                              .pegawaiList[index].idPegawai),
                                    ));
                              },
                              child: Card(
                                elevation: 4,
                                color: Colors.white,
                                child: Container(
                                  width: getWidth(),
                                  height: getHeight() * 0.08,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: getHeight() * 0.005),
                                        child: Container(
                                          width: getWidth() * 0.18,
                                          height: getHeight(),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey,
                                            image: provider.pegawaiList[index]
                                                        .foto ==
                                                    ''
                                                ? DecorationImage(
                                                    opacity: 0.6,
                                                    image: AssetImage(
                                                        'assets/default_profile.jpg'),
                                                  )
                                                : DecorationImage(
                                                    image: NetworkImage(provider
                                                        .pegawaiList[index]
                                                        .foto),
                                                    fit: BoxFit.fill),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              maxLines: 1,
                                              overflow: TextOverflow.fade,
                                              provider.pegawaiList[index]
                                                  .namaPegawai,
                                              style: GoogleFonts.nunito(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              maxLines: 1,
                                              overflow: TextOverflow.fade,
                                              provider
                                                  .pegawaiList[index].pangkat,
                                              style: GoogleFonts.nunito(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  })
                ],
              );
            }
          }),
    );
  }
}
