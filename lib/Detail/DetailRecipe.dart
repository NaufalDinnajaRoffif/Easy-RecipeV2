import 'dart:convert';
import 'package:easy_v3/utils/config.dart';
import 'package:easy_v3/utils/url.dart';
import 'package:easy_v3/utils/wishlist_button.dart';
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
    final res = await http.get(Uri.parse(URL.Base_URL + URL.recipes_URL));
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

  Widget textDetail(
    String inputText,
    double FontSize,
    Color Colors,
  ) {
    return Text(
      inputText,
      style: GoogleFonts.poppins(
        fontSize: FontSize,
        color: Colors,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   leading: IconButton(
        //       onPressed: () {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => BottomNavBar()));
        //       },
        //       icon: Icon(Icons.arrow_back_ios_new_rounded)),
        //   title: Text(
        //     "Menu Detail",
        //     style: GoogleFonts.poppins(
        //         color: Colors.white, fontWeight: FontWeight.w500),
        //   ),
        //   actions: [
        //     WishlistButton(),
        //     SizedBox(width: 15,),
        //   ],
        // ),
        body: isloaded
            ? CustomScrollView(
                physics: const ScrollPhysics(),
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
                        Text(
                          "Menu Detail",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        WishlistButton(),
                      ],
                    ),
                    toolbarHeight: 70,
                    pinned: true,
                    backgroundColor: HexColor(ColoR.primary),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(30),
                      child: Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
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
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          Container(
                            padding: EdgeInsets.only(top: 5, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                textDetail(
                                    "Made by: " +
                                        detailrecipe!.result!.author!.user
                                            .toString(),
                                    14,
                                    Colors.black),
                                textDetail(
                                    "Publication date: " +
                                        detailrecipe!
                                            .result!.author!.datePublished
                                            .toString(),
                                    14,
                                    Colors.black),
                                textDetail(
                                    "Servings: " +
                                        detailrecipe!.result!.servings
                                            .toString(),
                                    14,
                                    Colors.black),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          Image.asset("assets/line.png"),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          DefaultTabController(
                            length: 2,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  child: TabBar(
                                    unselectedLabelColor:
                                        HexColor(ColoR.tersier_TabBar),
                                    indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: HexColor(ColoR.tersier_TabBar)),
                                    labelColor: Colors.white,
                                    labelStyle: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                    labelPadding: EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 8),
                                    tabs: [
                                      new Text(
                                        "Ingredient",
                                      ),
                                      new Text(
                                        "Direction",
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    color: Colors.white,
                                    height: 900,
                                    child: TabBarView(children: <Widget>[
                                      new Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 600,
                                            child: ListView.separated(
                                              separatorBuilder: (context, _) =>
                                                  SizedBox(
                                                height: 6,
                                              ),
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: detailrecipe!
                                                  .result!.ingredient!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Text(
                                                  (index + 1).toString() +
                                                      ".  " +
                                                      detailrecipe!.result!
                                                          .ingredient![index],
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 600,
                                            child: ListView.separated(
                                              separatorBuilder: (context, _) =>
                                                  SizedBox(
                                                height: 6,
                                              ),
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: detailrecipe!
                                                  .result!.step!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Text(
                                                  "" +
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
                                      ),
                                    ]))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Center(child: ShimmerList()));
  }
}
