import 'dart:convert';
import 'package:easy_v3/utils/config.dart';
import 'package:easy_v3/utils/url.dart';
import 'package:easy_v3/widgets/shimmer_list.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:easy_v3/screens/home_screen.dart';
import 'package:easy_v3/BottomNavigationBar.dart';
import 'package:easy_v3/Model_API/RecipesModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:easy_v3/utils/color.dart';
import 'package:http/http.dart' as http;
import 'package:easy_v3/Model_API/detail_model.dart';

class DetailRecipe extends StatefulWidget {
  const DetailRecipe({Key? key, required this.keys}) : super(key: key);
  final String keys;

  @override
  State<DetailRecipe> createState() => _DetailRecipeState();
}

class _DetailRecipeState extends State<DetailRecipe> {
  detail_recipe_model? detailrecipe;
  bool isloaded = false;

  void getAllListRecipes() async {
    final res = await http.get(Uri.parse(URL.recipes_URL));
    print("status code ${res.statusCode}");

    final res1 = await http.get(Uri.parse(
        "https://masak-apa-tomorisakura.vercel.app/api/recipe/${widget.keys.toString()}"));

    detailrecipe =
        detail_recipe_model.fromJson(json.decode(res1.body.toString()));
    print("status code ${res1.statusCode}");

    setState(() {
      isloaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllListRecipes();
  }

  @override
  Widget build(BuildContext context) {
    // body: Container(
    //   child:isloaded? SingleChildScrollView(
    //     child: Column(
    //       children: [
    //
    //         Text(detailrecipe!.result!.desc.toString(),style: TextStyle(fontSize: 20),)
    //       ],
    //     ),
    //   ):CircularProgressIndicator()
    // ),
    return Scaffold(
        body: isloaded
            ? CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomNavBar()));
                            },
                            icon: Icon(Icons.arrow_back_ios_new_rounded)),
                        Icon(Icons.bookmark_add_outlined)
                      ],
                    ),
                    toolbarHeight: 60,
                    pinned: true,
                    backgroundColor: HexColor(ColoR.primary),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(30),
                      child: Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                detailrecipe!.result!.title.toString(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        width: double.maxFinite,
                        padding: EdgeInsets.only(top: 5, bottom: 20),
                      ),
                    ),
                    expandedHeight: 250,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        detailrecipe!.result!.thumb.toString(),
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          Container(
                            child: ExpandableText(
                              detailrecipe!.result!.desc.toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.black),
                              textAlign: TextAlign.start,
                              trimType: TrimType.lines,
                              trim: 6,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          Image.asset("assets/line.png"),
                          Padding(padding: EdgeInsets.only(bottom: 10)),

                          DefaultTabController(
                            length: 2,
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  child: TabBar(
                                    tabs: [
                                      new Text("Ingredient",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.poppins(
                                            fontSize: 17,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      new Text(
                                        "Step-byStep",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  height: double.maxFinite,
                                  child: TabBarView(children: <Widget>[
                                    new Column(
                                      children: [
                                        SizedBox(
                                          height: 300,
                                          child: ListView.builder(
                                            itemCount: detailrecipe!
                                                .result!.ingredient!.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Text(
                                                detailrecipe!
                                                    .result!.ingredient![index],
                                                maxLines: 10,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                    new Column(
                                      children: [
                                        SizedBox(
                                          height: 600,
                                          child: ListView.builder(
                                            itemCount: detailrecipe!
                                                .result!.step!.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Text(
                                                detailrecipe!
                                                    .result!.step![index],
                                                maxLines: 10,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    )
                                  ]),
                                ),
                              ],
                            ),
                          ),

                          // Text(
                          //   detailrecipe!.result!.needItem.toString(),
                          //   style: TextStyle(fontSize: 14),
                          // ),

                          // Text("Ingredient",
                          //     textAlign: TextAlign.start,
                          //     style: GoogleFonts.poppins(
                          //       fontSize: 17,
                          //       fontWeight: FontWeight.w600,
                          //     )),
                          //

                          //     ),
                          //
                          //     Text(
                          //       "Step-byStep",
                          //       textAlign: TextAlign.start,
                          //       style: GoogleFonts.poppins(
                          //         fontSize: 15,
                          //         fontWeight: FontWeight.w600,
                          //       ),
                          //     ),

                          // ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Center(child: Image.asset(Config.anime_logo)));
  }
}
