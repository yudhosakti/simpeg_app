import 'package:flutter/material.dart';
import 'package:simpeg_app/view/widget/ai_widget.dart';
import 'package:simpeg_app/view/widget/home_widget.dart';
import 'package:simpeg_app/view/widget/profile_widget.dart';

class BottomNavProvider extends ChangeNotifier {
  List<Widget> page = [HomeWidget(), AiWidget(), ProfileWidget()];

  int pageIndex = 0;

  void changeWidget(int newIndex) {
    pageIndex = newIndex;
    notifyListeners();
  }
}
