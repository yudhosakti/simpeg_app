import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simpeg_app/providers/auth_provider.dart';
import 'package:simpeg_app/view/pages/main_page.dart';
import 'package:simpeg_app/view/pages/onboarding_page.dart';
import 'package:simpeg_app/view/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OnboardingPage(),
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
            title: "Login",
            subTitle: "Login to continue use the app",
          ),
          Consumer<AuthProvider>(builder: (context, provider, child) {
            return TextEmailFormWidget(
              code: 0,
              iconValue: false,
              editingController: provider.etEmailLogin,
              hint: "Enter Your Email",
              isInVisible: false,
              isPassword: false,
              title: "Email",
            );
          }),
          Consumer<AuthProvider>(builder: (context, provider, child) {
            return TextEmailFormWidget(
              code: 1,
              iconValue: provider.passwordLogin,
              editingController: provider.etPasswordLogin,
              hint: "Enter Your Password",
              isInVisible: true,
              isPassword: true,
              title: "Password",
            );
          }),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.06,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password ?",
                      style: GoogleFonts.nunito(
                          color: Colors.blueAccent,
                          fontSize: 19,
                          fontWeight: FontWeight.w700),
                    ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03,
                vertical: MediaQuery.of(context).size.height * 0.01),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.08,
              child:
                  Consumer<AuthProvider>(builder: (context, provider, child) {
                return ElevatedButton(
                    style: ButtonStyle(
                        elevation: WidgetStatePropertyAll(5),
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromARGB(255, 60, 129, 249))),
                    onPressed: () async {
                      if (await provider.loginUser()) {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return MainPage();
                          },
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.black,
                            content: Text(
                              provider.errorMessage,
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                              ),
                            )));
                      }
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ));
              }),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.06,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 1,
                  color: Colors.black,
                ),
                Text(
                  "Or Login With",
                  style: GoogleFonts.nunito(
                      color: Colors.grey, fontWeight: FontWeight.w700),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 1,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.06,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        size: 36,
                        Icons.fingerprint,
                        color: Colors.black,
                      )),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't Have Account ?",
                style: GoogleFonts.nunito(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return RegisterPage();
                      },
                    ));
                  },
                  child: Text(
                    "Register Now",
                    style: GoogleFonts.nunito(
                        fontSize: 18,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w700),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class TopTitleWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const TopTitleWidget(
      {super.key, required this.subTitle, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: GoogleFonts.nunito(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02),
            child: Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  subTitle,
                  style: GoogleFonts.nunito(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class LogoTopWidget extends StatelessWidget {
  const LogoTopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/appicon.png'),
                          fit: BoxFit.fill)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextEmailFormWidget extends StatelessWidget {
  final String title;
  final String hint;
  final int code;
  final bool iconValue;
  final TextEditingController editingController;
  final bool isPassword;
  final bool isInVisible;
  const TextEmailFormWidget(
      {super.key,
      required this.isPassword,
      required this.iconValue,
      required this.code,
      required this.hint,
      required this.isInVisible,
      required this.editingController,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.018),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.13,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.005),
                  child: Text(
                    title,
                    style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: TextFormField(
                controller: editingController,
                obscureText: iconValue,
                style: GoogleFonts.nunito(color: Colors.black, fontSize: 18),
                decoration: InputDecoration(
                    suffixIcon: isPassword
                        ? Consumer<AuthProvider>(
                            builder: (context, provider, child) {
                            return IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  provider.changeObsCure(code);
                                },
                                icon: Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: Colors.black,
                                ));
                          })
                        : null,
                    hintText: hint,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.025,
                        horizontal: MediaQuery.of(context).size.width * 0.025),
                    border: InputBorder.none),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
