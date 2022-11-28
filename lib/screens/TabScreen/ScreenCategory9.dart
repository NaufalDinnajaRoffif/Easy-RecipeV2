import 'dart:convert';
import 'package:easy_v3/utils/url.dart';
import 'package:easy_v3/widgets/ListView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:easy_v3/Detail/DetailRecipe.dart';
import 'package:http/http.dart' as http;
import 'package:easy_v3/Model_API/RecipesModel.dart';
import 'package:easy_v3/widgets/shimmer_list.dart';

class Sarapan extends StatefulWidget {
  const Sarapan({Key? key}) : super(key: key);

  @override
  State<Sarapan> createState() => _SarapanState();
}

class _SarapanState extends State<Sarapan> {
  RecipesModel? recipeModel;
  bool isloaded = false;

  void getAllListCategoryScreen() async {
    final res = await http.get(Uri.parse(
        URL.Base_URL + URL.recipes_by_category_URL + URL.recipes_URL_Sarapan));
    print("status code " + res.statusCode.toString());

    recipeModel = RecipesModel.fromJson(json.decode(res.body.toString()));

    print("Recipes 0 : " + recipeModel!.results![0].title.toString());
    setState(() {
      isloaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllListCategoryScreen();
  }

  @override
  Widget build(BuildContext context) {
    return isloaded
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
                          keys: recipeModel!.results![index].key!.toString(),
                        ),
                      ));
                },
                child: listViewVerti(
                    inputTextTitle:
                        recipeModel!.results![index].title.toString(),
                    inputTextDifficulty:
                        recipeModel!.results![index].difficulty.toString(),
                    imageURL: recipeModel!.results![index].thumb.toString()),
              );
            },
          )
        : ShimmerList();
  }
}
