import 'package:flutter/material.dart';
import 'package:easy_v3/Model_API/RecipesModel.dart';
import 'package:easy_v3/utils/config.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatefulWidget {
  const ShimmerList({Key? key}) : super(key: key);

  @override
  State<ShimmerList> createState() => _ShimmerListState();
}

class _ShimmerListState extends State<ShimmerList> {
  RecipesModel? recipeDB;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Image.asset(
          Config.anime_logo,
          width: 55,
          height: 55,
        ),
      ),
      // child: ListView.builder(
      //     itemCount: recipeDB!.results!.length,
      //     itemBuilder: (context, index){
      //       return Padding(
      //           padding: EdgeInsets.symmetric(horizontal: 8),
      //           child: Shimmer.fromColors(
      //               baseColor: Colors.grey,
      //               highlightColor: Colors.white,
      //               child: ShimmerLayout(), ),);
      //
      //     })
    );
  }
}

// class ShimmerLayout extends StatefulWidget {
//   const ShimmerLayout({Key? key}) : super(key: key);
//
//   @override
//   State<ShimmerLayout> createState() => _ShimmerLayoutState();
// }
//
// class _ShimmerLayoutState extends State<ShimmerLayout> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             height: 10,
//             width: 278,
//             color: Colors.grey,
//           )
//         ],
//       ),
//     );
//   }
// }
