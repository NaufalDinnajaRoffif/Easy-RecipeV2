import 'dart:async';
import 'package:easy_v3/screens/login_screen.dart';
import 'package:easy_v3/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_v3/provider/sign_in_provider.dart';
import 'package:easy_v3/screens/home_screen.dart';
import 'package:easy_v3/BottomNavigationBar.dart';
import 'package:easy_v3/utils/config.dart';
import 'package:easy_v3/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // init state
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();
    // create a timer of 2 seconds
    Timer( Duration(seconds: 2), () {
      sp.isSignedIn == false
          ? nextScreen(context, const LoginScreen())
          : nextScreen(context, const BottomNavBar());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Config.splash_bg), fit: BoxFit.cover)),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 500,
            ),
            Text(
              "Let's\nCook",
              style: GoogleFonts.poppins(
                fontSize: 34,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Find The Best Recipe",
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor(ColoR.primary),
                ),
                child: Text("Start Cooking",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            Expanded(child: SizedBox()),
          ],
        )),
      ),
    );
  }
}
