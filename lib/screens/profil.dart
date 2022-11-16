import 'package:easy_v3/utils/color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:easy_v3/screens/login_screen.dart';
import 'package:easy_v3/utils/next_screen.dart';
import 'package:easy_v3/BottomNavigationBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_v3/utils/config.dart';
import 'package:easy_v3/provider/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:easy_v3/screens/help.dart';

class Profil_page extends StatefulWidget {
  const Profil_page({Key? key}) : super(key: key);

  @override
  State<Profil_page> createState() => _Profil_pageState();
}

class _Profil_pageState extends State<Profil_page> {
  Future getData() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // change read to watch!!!!
    final sp = context.watch<SignInProvider>();
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //     backgroundColor: Colors.white,
      //   title: Row(
      //     children: [
      //       IconButton(onPressed: (){
      //         Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavBar() ));
      //       }, icon:Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,) ),
      //       const SizedBox(
      //         width: 10,
      //       ),
      //       Text("Account",style: GoogleFonts.poppins(
      //                   fontSize: 20,
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.w500),),
      //
      //     ],
      //   )
      // ),
      body: Container(
        margin: EdgeInsets.only(top: 20 ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
          Text("ACCOUNT",style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500),),
            // Row(
            //   children: [
            //     Text("ACCOUNT",
            //
            //         style: GoogleFonts.poppins(
            //             fontSize: 50,
            //             color: Colors.black,
            //             fontWeight: FontWeight.w500),),
            //     Spacer()
            //   ],
            // ),
            const SizedBox(
              height: 15,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage("${sp.imageUrl}"),
              radius: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              " ${sp.name}",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black,),
              // style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              "${sp.email}",
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: HexColor(ColoR.primary),),
              // style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 50,
            ),

            Container(
              alignment: AlignmentDirectional.topStart,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Setting",
                    style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        ImageIcon(AssetImage(Config.lengue),color: HexColor(ColoR.primary),),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                        Text("Language",
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        ImageIcon(AssetImage(Config.dark_light),color: HexColor(ColoR.tersier_dark_mode),),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                        Text("Dark Mode",
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> help_page() ));
                    },
                    child: Row(
                      children: [
                        ImageIcon(AssetImage(Config.help),color: HexColor(ColoR.tersier_help),),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                        Text("Help",
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      sp.userSignOut();
                      nextScreenReplace(context, const LoginScreen());
                    },
                    child: Row(
                      children: [
                        ImageIcon(AssetImage(Config.logout),color: HexColor(ColoR.tersier_logout),),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                        Text("Logout",
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Text(
            //   "${sp.uid}",
            //   style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            // ),
            const SizedBox(
              height: 10,
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text("PROVIDER:"),
            //     const SizedBox(
            //       width: 5,
            //     ),
            //     Text("${sp.provider}".toUpperCase(),
            //         style: const TextStyle(color: Colors.red)),
            //   ],
            // ),
            const SizedBox(
              height: 20,
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       sp.userSignOut();
            //       nextScreenReplace(context, const LoginScreen());
            //     },
            //     child: const Text("SIGNOUT",
            //         style: TextStyle(
            //           color: Colors.white,
            //         )))
          ],
        ),
      ),
    );
  }
}
