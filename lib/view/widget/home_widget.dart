import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simpeg_app/view/pages/detail_pegawai_page.dart';
import 'package:simpeg_app/view/pages/search_pegawai_page.dart';
import 'package:simpeg_app/view/pages/tambah_pegawai_page.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01),
          child: Card(
            elevation: 6,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            opacity: 0.6,
                            image: AssetImage('assets/default_profile.jpg'),
                          ),
                          color: Colors.grey,
                          shape: BoxShape.circle),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Yudho Sakti Rama Sultan Alfaridzi",
                          style: GoogleFonts.nunito(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        Text(
                          "yudhosakti28@gmail.com",
                          style: GoogleFonts.nunito(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.08,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchPegawaiPage(),
                            ));
                      },
                      child: TextFormField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Cari Pegawai",
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.7)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            enabled: false,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Card(
                    child: Container(
                      child: Center(
                        child: Icon(
                          size: 28,
                          Icons.display_settings_sharp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.06,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Text(
                "Menu",
                style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.175,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Card(
                          color: Color.fromRGBO(226, 97, 97, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height,
                            child: MenuValueWidget(
                              icon: Icons.save,
                              seconTitle: "Semua Pegawai",
                              titleFirst: "Lihat",
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TambahPegawaiPage(),
                              ));
                        },
                        child: Card(
                          color: Color.fromRGBO(66, 219, 219, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height,
                            child: MenuValueWidget(
                              icon: Icons.save,
                              seconTitle: "Pegawai",
                              titleFirst: "Tambah",
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.175,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        color: Color.fromRGBO(67, 81, 209, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height,
                          child: MenuValueWidget(
                            icon: Icons.save,
                            seconTitle: "Semua User",
                            titleFirst: "Lihat",
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TambahPegawaiPage(),
                              ));
                        },
                        child: Card(
                          color: Color.fromRGBO(219, 146, 72, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height,
                            child: MenuValueWidget(
                              icon: Icons.save,
                              seconTitle: "User",
                              titleFirst: "Tambah",
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        DoubleTextWidget(
          title: "Recent Employee",
        ),
        ProfileHorizontalWidget(),
        DoubleTextWidget(
          title: "Recent User",
        ),
        ProfileHorizontalWidget(),
      ],
    );
  }
}

class DoubleTextWidget extends StatelessWidget {
  final String title;
  const DoubleTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.06,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileHorizontalWidget extends StatelessWidget {
  const ProfileHorizontalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.12,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01,
                vertical: MediaQuery.of(context).size.height * 0.005),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DetailPegawaiPage(
                      idPegawai: 1,
                    );
                  },
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            opacity: 0.6,
                            image: AssetImage('assets/default_profile.jpg'),
                          ),
                          color: Colors.grey,
                          shape: BoxShape.circle),
                    ),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      "Yudho Sakti",
                      style: GoogleFonts.nunito(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MenuValueWidget extends StatelessWidget {
  final String titleFirst;
  final String seconTitle;
  final IconData icon;
  const MenuValueWidget(
      {super.key,
      required this.icon,
      required this.seconTitle,
      required this.titleFirst});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.06,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Text(
                    titleFirst,
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Text(
                    seconTitle,
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  ),
                ],
              )
            ],
          ),
        ))
      ],
    );
  }
}
