import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simpeg_app/view/pages/login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    image: AssetImage('assets/cover.jpg'), fit: BoxFit.cover)),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.01),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.17,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('assets/appicon.png'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Expanded(
                              child: Container(
                            child: Text(
                              "Sistem Informasi Pegawai Lokal (SimLo) BPS Pacitan",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03),
                        child: Text(
                          "Memanajemen Sistem Kepegawaian Lokal di BPS Pacitan",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    elevation: WidgetStatePropertyAll(5),
                                    backgroundColor: WidgetStatePropertyAll(
                                        Color.fromARGB(255, 60, 129, 249))),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ));
                                },
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    side: WidgetStatePropertyAll(BorderSide(
                                        width: 0.8, color: Colors.black)),
                                    elevation: WidgetStatePropertyAll(5),
                                    backgroundColor:
                                        WidgetStatePropertyAll(Colors.white)),
                                onPressed: () {},
                                child: Text(
                                  "Register",
                                  style: GoogleFonts.nunito(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )),
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
