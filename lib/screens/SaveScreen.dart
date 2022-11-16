import 'package:easy_v3/BottomNavigationBar.dart';
import 'package:easy_v3/Model_API/SaveDB.dart';
import 'package:easy_v3/utils/color.dart';
import 'package:easy_v3/utils/config.dart';
import 'package:easy_v3/widgets/shimmer_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:easy_v3/Model_API/SaveModel.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({Key? key}) : super(key: key);

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  List<SaveModel> dataListSave = [];
  bool isloaded = false;

  Future read() async {
    setState(() {
      isloaded = true;
    });
    dataListSave = await SaveDB.instance.readAll();
    print("Length List " + dataListSave.length.toString());
    setState(() {
      isloaded = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    read();
  }

  showDeleteDialog(BuildContext context, String? name) {
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop('dialog');
        },
        child: Text("Nope"));
    Widget okButton = TextButton(
        onPressed: () async {
          setState(() {
            isloaded = true;
          });
          await SaveDB.instance.delete(name);
          read();
          setState(() {
            isloaded = false;
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BottomNavBar()));
          Navigator.pop(context);
          Navigator.of(context, rootNavigator: true).pop('dialog');
        },
        child: Text("Delete"));

    AlertDialog alert = AlertDialog(
      content: Text("Mau kamu hapus??"),
      actions: [cancelButton, okButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 16, right: 20),
        child: ListView(
          children: <Widget>[
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Save ",
                      style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                      text: "Recipes ",
                      style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: HexColor(ColoR.primary),
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            // Container(
            //   child: isloaded
            //       ? Center(
            //           child: ShimmerList(),
            //         )
            //       : dataListSave.length == 0
            //           ? Center(
            //               child: Image.asset(Config.anime_logo),
            //             )
            //           : ListView.builder(
            //               itemCount: dataListSave.length,
            //               itemBuilder: (c, index) {
            //                 final item = dataListSave[index];
            //                 return Container(
            //                   margin: EdgeInsets.only(top: 8),
            //                   width: 315,
            //                   height: 220,
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(13),
            //                     color: Colors.white
            //                   ),
            //                   child: Column(
            //                     children: <Widget>[
            //
            //                     ],
            //                   ),
            //                 );
            //               }),
            // ),
          ],
        ),
      ),
    );
  }
}
