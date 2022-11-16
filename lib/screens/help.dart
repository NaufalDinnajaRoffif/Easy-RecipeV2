import 'package:easy_v3/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class help_page extends StatefulWidget {
  const help_page({Key? key}) : super(key: key);

  @override
  State<help_page> createState() => _help_pageState();
}

class _help_pageState extends State<help_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor(ColoR.tersier),
        title: Text("Help",style: GoogleFonts.poppins(),),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(

            children: [
              const SizedBox(
                height: 20,
              ),
              InkWell(
                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Report a Problem",style: GoogleFonts.poppins()),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
               SizedBox(
                height: 20,
              ),
              InkWell(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Account Status",style: GoogleFonts.poppins(),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
               SizedBox(
                height: 20,
              ),
              InkWell(

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Help Center",style: GoogleFonts.poppins()),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
               SizedBox(
                height: 20,
              ),
              InkWell(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Support Request",style: GoogleFonts.poppins()),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
