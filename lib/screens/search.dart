import 'package:easy_v3/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class search_page extends StatefulWidget {
  const search_page({Key? key}) : super(key: key);

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(bottom: 40)),
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Search ",
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w600
                        )
                      ),
                      TextSpan(
                          text: "Recipes",
                          style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: HexColor(ColoR.primary),
                              fontWeight: FontWeight.w600
                          )
                      ),
                    ]
                )),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            SizedBox(
              height: 49,
              child: TextField(
                textCapitalization: TextCapitalization.words,
                textAlignVertical: TextAlignVertical.bottom,
                style: TextStyle(fontSize: 16, color: HexColor(ColoR.primary)),
                cursorColor: HexColor(ColoR.primary),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: HexColor('EEAF0E'),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor(ColoR.primary)), borderRadius: BorderRadius.all(Radius.circular(9))
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor(ColoR.primary)),
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                  hintText: "Search Recipes",
                  hintStyle: TextStyle(color: HexColor(ColoR.primary)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
