import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AiWidget extends StatelessWidget {
  const AiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Decicion Support System (Gemini)",
          style: GoogleFonts.nunito(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.06,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.01,
                      vertical: MediaQuery.of(context).size.height * 0.005),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            padding: WidgetStatePropertyAll(EdgeInsets.zero),
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.black)),
                        onPressed: () {},
                        child: Text(
                          "Edit Employee",
                          style: GoogleFonts.nunito(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.01,
                      vertical: MediaQuery.of(context).size.height * 0.005),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Center(
                        child: Text(
                          "Total Employee Choose : 30",
                          style: GoogleFonts.nunito(
                              color: Colors.white, fontSize: 19),
                        ),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          )
        ],
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.06,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height,
                child: TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Ketikkan Agenda Kegiatan",
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),
              Expanded(
                  child: Card(
                color: Colors.grey.withOpacity(0.4),
                shape: CircleBorder(),
                child: Container(
                  child: Center(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                          color: Colors.black,
                        )),
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
