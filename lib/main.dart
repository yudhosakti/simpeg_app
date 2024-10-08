import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simpeg_app/providers/auth_provider.dart';
import 'package:simpeg_app/providers/bottom_nav_provider.dart';
import 'package:simpeg_app/providers/detail_pegawai_provider.dart';
import 'package:simpeg_app/providers/search_provider.dart';
import 'package:simpeg_app/providers/tambah_karyawan_provider.dart';
import 'package:simpeg_app/view/pages/onboarding_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => BottomNavProvider(),),
      ChangeNotifierProvider(create: (context) => TambahKaryawanProvider(),),
      ChangeNotifierProvider(create: (context) => AuthProvider(),),
      ChangeNotifierProvider(create: (context) => SearchProvider(),),
      ChangeNotifierProvider(create: (context) => DetailPegawaiProvider(),)
    ],
    child: const MyApp()));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    );
  }
}
