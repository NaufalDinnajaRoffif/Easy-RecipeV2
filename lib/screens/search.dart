import 'dart:convert';

import 'package:easy_v3/Detail/DetailRecipe.dart';
import 'package:easy_v3/Model_API/RecipesModel.dart';
import 'package:easy_v3/utils/color.dart';
import 'package:easy_v3/widgets/ListView.dart';
import 'package:easy_v3/widgets/shimmer_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:easy_v3/utils/url.dart';

class search_page extends StatefulWidget {
  const search_page({Key? key}) : super(key: key);

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  RecipesModel? recipeModel;
  bool isloaded = false;
  TextEditingController searchController = TextEditingController();

  void getAllListRecipes() async {
    final res = await http.get(Uri.parse(
        URL.Base_URL + URL.search_recipes_URL + searchController!.toString()));
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
    getAllListRecipes();
  }

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
                text: TextSpan(children: [
              TextSpan(
                  text: "Search ",
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
              TextSpan(
                  text: "Recipes",
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: HexColor(ColoR.primary),
                      fontWeight: FontWeight.w600)),
            ])),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            SizedBox(
              height: 49,
              child: TextField(
                controller: searchController,
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
                      borderSide:
                          BorderSide(color: HexColor(ColoR.primary), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(9))),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor(ColoR.primary)),
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                  hintText: "Search Recipes",
                  hintStyle: TextStyle(color: HexColor(ColoR.primary)),
                ),
              ),
            ),
            Center(
                child: Card(
              child: isloaded == true
                  ? ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: recipeModel!.results!.length,
                      separatorBuilder: (context, _) => SizedBox(
                            height: 20,
                          ),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailRecipe(
                                        keys: recipeModel!.results![index].key!
                                            .toString())));
                          },
                          child: listViewVerti(
                              inputTextTitle:
                                  recipeModel!.results![index].title.toString(),
                              inputTextDifficulty: recipeModel!
                                  .results![index].difficulty
                                  .toString(),
                              imageURL: recipeModel!.results![index].thumb
                                  .toString()),
                        );
                      })
                  : ShimmerList(),
            )),
          ],
        ),
      ),
    );
  }
}
