import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';
class AstroShimmer extends StatelessWidget {
  const AstroShimmer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: Colors.white54,
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        child: StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            itemCount: 5,
            itemBuilder: (context, index) => Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  ],
                )
            ),
            staggeredTileBuilder:(index)=>StaggeredTile.count(2, index.isEven ? 5 : 3)
        ),
      )
    );
  }
}
