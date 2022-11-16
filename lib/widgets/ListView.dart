import 'package:easy_v3/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class listViewVerti extends StatelessWidget {
  const listViewVerti ({required this.inputTextTitle,required this.inputTextTime, required this.inputTextDifficulty, required this.imageURL});
  final String inputTextTitle;
  final String inputTextTime;
  final String inputTextDifficulty;
  final String imageURL;

  Widget build (BuildContext context) {
    return Container(
      width: 278,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.network(
                    imageURL,
                  ),
                ),
                Positioned(
                  top: 12,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                    child: Container(
                      constraints: BoxConstraints(
                        minWidth: 60,
                        maxWidth: 70,
                      ),
                      height: 29,
                      color: HexColor(ColoR.primary),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            inputTextDifficulty,
                            style: TextStyle(
                                color: Colors.white, fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  inputTextTime,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  inputTextTitle,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
