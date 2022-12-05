import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:easy_v3/provider/sign_in_provider.dart';
import 'package:easy_v3/screens/search.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/akar_icons.dart';
import 'package:iconify_flutter/icons/codicon.dart';
import 'package:easy_v3/screens/profil.dart';
import 'package:easy_v3/screens/SaveScreen.dart';
import 'package:easy_v3/screens/home_screen.dart';
import 'package:easy_v3/utils/config.dart';

import 'utils/color.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  Future getData() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  int myIndex = 0;

  List<Widget> widgetList = const [
    HomeScreen(),
    SaveScreen(),
    Profil_page()
  ];

  @override
  Widget build(BuildContext context) {
    final sp = context.watch<SignInProvider>();
    return Scaffold(
      body: Center(
        child: widgetList[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: HexColor(ColoR.primary),
          type: BottomNavigationBarType.fixed,
          iconSize: 22,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: [
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.home),
                label: ""),
            // BottomNavigationBarItem(
            //     icon: ImageIcon(AssetImage(Config.search)), label: ""),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.bookmark),
                label: ""),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage("${sp.imageUrl}"),
                  radius: 15,
                ),
                label: ""),
          ]),
    );
  }
}
