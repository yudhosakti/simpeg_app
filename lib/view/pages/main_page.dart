import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:simpeg_app/providers/bottom_nav_provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Consumer<BottomNavProvider>(builder: (context, provider, child) {
        return provider.page[provider.pageIndex];
      }),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child:
              Consumer<BottomNavProvider>(builder: (context, provider, child) {
            return Card(
              elevation: 5,
              child: GNav(
                tabMargin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03),
                style: GnavStyle.google,
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 12,
                activeColor: Color.fromRGBO(18, 205, 217, 1),
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Color.fromRGBO(37, 40, 54, 1),
                selectedIndex: provider.pageIndex,
                onTabChange: (value) {
                  provider.changeWidget(value);
                },
                color: Colors.black,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.history,
                    text: 'AI Chat',
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
