import 'package:flutter/material.dart';
import 'package:flutter_ex/data_provider/database.dart';
import 'package:flutter_ex/shimmers/aztro_shimmer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class NasaScreen extends ConsumerWidget {


  @override
  Widget build(BuildContext context, watch) {
    final data = watch(nasaProvider);
    return  Scaffold(
      body: data.when(
          data: (data){
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemCount: data.length,
                  itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(data[index].imgUrl, fit: BoxFit.cover, height: 500,)),
                  staggeredTileBuilder:(index)=>StaggeredTile.count(2, index.isEven ? 2.5 : 1.5)
              ),
            );
          },
          loading: () => AstroShimmer(),
          error: (err, stack) => Center(child: Text('$err'))
      ),
    );

  }
}
