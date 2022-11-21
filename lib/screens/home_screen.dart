import 'dart:convert';
import 'package:easy_v3/screens/TabScreen/ScreenCategory.dart';
import 'package:easy_v3/screens/TabScreen/ScreenCategory1.dart';
import 'package:easy_v3/screens/TabScreen/ScreenCategory2.dart';
import 'package:easy_v3/screens/TabScreen/ScreenCategory3.dart';
import 'package:easy_v3/screens/TabScreen/ScreenCategory4.dart';
import 'package:easy_v3/screens/TabScreen/ScreenCategory5.dart';
import 'package:easy_v3/screens/TabScreen/ScreenCategory6.dart';
import 'package:easy_v3/screens/TabScreen/ScreenCategory7.dart';
import 'package:easy_v3/screens/TabScreen/ScreenCategory8.dart';
import 'package:easy_v3/screens/TabScreen/ScreenCategory9.dart';
import 'package:easy_v3/provider/sign_in_provider.dart';
import 'package:easy_v3/screens/search.dart';
import 'package:easy_v3/utils/color.dart';
import 'package:easy_v3/utils/url.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:easy_v3/Detail/DetailRecipe.dart';
import 'package:easy_v3/Model_API/RecipesModel.dart';
import 'package:http/http.dart' as http;
import 'package:easy_v3/widgets/shimmer_list.dart';
import 'package:easy_v3/widgets/ListView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future getData() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();
  }

  RecipesModel? recipeModel;
  bool isloaded = false;

  void getAllListRecipes() async {
    final res = await http.get(Uri.parse(URL.recipes_URL));
    print("status code " + res.statusCode.toString());
    recipeModel = RecipesModel.fromJson(json.decode(res.body.toString()));
    print("Recipe 0 : " + recipeModel!.results![0].title.toString());
    setState(() {
      isloaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getAllListRecipes();
  }

  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
        length: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: TabBar(
                  unselectedLabelColor: HexColor(ColoR.secondary),
                  indicatorColor: Colors.transparent,
                  labelColor: HexColor(ColoR.primary),
                  labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 30),
                  tabs: [
                    Tab(
                      child: Text("Dessert"),
                    ),
                    Tab(
                      child: Text("Masakan Hari Raya"),
                    ),
                    Tab(
                      child: Text("Masakan Tradisional"),
                    ),
                    Tab(
                      child: Text("Menu Makan Malam"),
                    ),
                    Tab(
                      child: Text("Menu Makan Siang"),
                    ),
                    Tab(
                      child: Text("Resep Ayam"),
                    ),
                    Tab(
                      child: Text("Resep Daging"),
                    ),
                    Tab(
                      child: Text("Resep Sayuran"),
                    ),
                    Tab(
                      child: Text("Resep Seafood"),
                    ),
                    Tab(
                      child: Text("Sarapan"),
                    ),
                  ]),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(
                  top: 15,
                ),
                height: MediaQuery.of(context).size.height * 0.30,
                child: TabBarView(children: [
                  Dessert(),
                  MasakanHariRaya(),
                  MasakanTradisional(),
                  MenuMakanMalam(),
                  MenuMakanSiang(),
                  ResepAyam(),
                  ResepDaging(),
                  ResepSayuran(),
                  ResepSeafood(),
                  Sarapan(),
                ]),
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final sp = context.watch<SignInProvider>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 16, right: 20),
        child: ListView(
          children: <Widget>[
            RichText(
                text: TextSpan(
              children: [
                TextSpan(
                    text: "Hello ",
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                    text: "${sp.name}",
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        color: HexColor(ColoR.primary),
                        fontWeight: FontWeight.w600)),
              ],
            )),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 49,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9)),
                      side: BorderSide(
                        width: 2,
                        color: HexColor(
                          ColoR.primary,
                        ),
                      )),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return search_page();
                    }));
                  },
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.search_rounded,
                          color: HexColor(ColoR.primary),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Search Recipes",
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: HexColor(ColoR.primary)),
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Trending Now",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              height: 270,
              child: isloaded == true
                  ? ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      separatorBuilder: (context, _) => SizedBox(
                        width: 20,
                      ),
                      itemCount: recipeModel!.results!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailRecipe(
                                    keys: recipeModel!.results![index].key!
                                        .toString(),
                                  ),
                                ));
                          },
                          child: listViewVerti(
                              inputTextTitle:
                                  recipeModel!.results![index].title.toString(),
                              inputTextTime:
                                  recipeModel!.results![index].times.toString(),
                              inputTextDifficulty: recipeModel!
                                  .results![index].difficulty
                                  .toString(),
                              imageURL: recipeModel!.results![index].thumb
                                  .toString()),
                        );
                      },
                    )
                  : ShimmerList(),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Popular Category",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            _tabSection(context),
          ],
        ),
      ),
    );
  }
}
