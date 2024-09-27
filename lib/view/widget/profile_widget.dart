import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simpeg_app/providers/auth_provider.dart';
import 'package:simpeg_app/view/pages/onboarding_page.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Your Profile",
          style: GoogleFonts.nunito(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: Consumer<AuthProvider>(builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.23,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              image: provider.adminModel!.avatar == ''
                                  ? DecorationImage(
                                      opacity: 0.6,
                                      image: AssetImage(
                                          'assets/default_profile.jpg'),
                                    )
                                  : DecorationImage(
                                      image: NetworkImage(
                                          provider.adminModel!.avatar),
                                      fit: BoxFit.fill),
                              shape: BoxShape.circle,
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Text(
                    provider.adminModel!.username,
                    style: GoogleFonts.nunito(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.blueAccent)),
                          onPressed: () {},
                          child: Text(
                            "Edit Profile",
                            style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.redAccent)),
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return OnboardingPage();
                              },
                            ));
                          },
                          child: Text(
                            "Logout",
                            style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          )),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.005,
                  horizontal: MediaQuery.of(context).size.width * 0.02),
              child: Text(
                "User Information",
                style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ),
            UserInformationComponentWidget(
              icon: Icons.person,
              title: "Username",
              value: provider.adminModel!.username,
            ),
            UserInformationComponentWidget(
              icon: Icons.email,
              title: "Email Address",
              value: provider.adminModel!.email,
            ),
            UserInformationComponentWidget(
              icon: Icons.admin_panel_settings_sharp,
              title: "Role",
              value: provider.adminModel!.role,
            ),
            UserInformationComponentWidget(
              icon: Icons.timelapse_outlined,
              title: "Last Login",
              value: "19-08-2024",
            )
          ],
        );
      }),
    );
  }
}

class UserInformationComponentWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  const UserInformationComponentWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.11,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Icon(
                  size: 42,
                  icon,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.nunito(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    value,
                    style: GoogleFonts.nunito(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
