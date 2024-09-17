import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simpeg_app/data/pegawai_data.dart';
import 'package:simpeg_app/models/pegawai_get_model.dart';
import 'package:simpeg_app/view/pages/detail_pegawai_page.dart';

class ViewPegawaiPage extends StatelessWidget {
  const ViewPegawaiPage({super.key});

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
      appBar: AppBar(
        title: Text("Semua Pegawai"),
      ),
      body: FutureBuilder(
          future: PegawaiData().getAllPegawai(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  "No Data Yet",
                  style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              );
            } else {
              List<PegawaiGetModel> allPegawai = snapshot.data!;
              return ListView.builder(
                itemCount: allPegawai.length,
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
                                  idPegawai: allPegawai[index].idPegawai),
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
                                    image: allPegawai[index].foto == ''
                                        ? DecorationImage(
                                            opacity: 0.6,
                                            image: AssetImage(
                                                'assets/default_profile.jpg'),
                                          )
                                        : DecorationImage(
                                            image: NetworkImage(
                                                allPegawai[index].foto),
                                            fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      allPegawai[index].namaPegawai,
                                      style: GoogleFonts.nunito(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      allPegawai[index].pangkat,
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
          }),
    );
  }
}
