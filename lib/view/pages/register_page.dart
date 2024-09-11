import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simpeg_app/view/pages/login_page.dart';
import 'package:simpeg_app/view/pages/onboarding_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return OnboardingPage();
                },
              ));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: ListView(
        children: [
          LogoTopWidget(),
          TopTitleWidget(
            title: "Register",
            subTitle: "Enter your personal information",
          ),
          TextEmailFormWidget(
            editingController: TextEditingController(),
            hint: "Enter Your Name",
            isInVisible: false,
            isPassword: false,
            title: "Username",
          ),
          TextEmailFormWidget(
            editingController: TextEditingController(),
            hint: "Enter Your Email",
            isInVisible: false,
            isPassword: false,
            title: "Email",
          ),
          TextEmailFormWidget(
            editingController: TextEditingController(),
            hint: "Enter Password",
            isInVisible: true,
            isPassword: true,
            title: "Password",
          ),
          TextEmailFormWidget(
            editingController: TextEditingController(),
            hint: "Enter Confirm Password",
            isInVisible: true,
            isPassword: true,
            title: "Confirm Password",
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.06,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 60, 129, 249))),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ));
                  },
                  child: Text(
                    "Register",
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
