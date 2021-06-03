import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ex/data_provider/database.dart';
import 'package:flutter_ex/shimmers/aztro_shimmer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class AstroScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, watch) {
    final data = watch(astroProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Rashifal'),
      ),
      body: data.when(
          data:(data){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemCount: data.length,
                  itemBuilder: (context, index) => Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data[index].compatibility, style: TextStyle(fontSize: 22,
                            color: Colors.pink[300],decoration: TextDecoration.underline),),
                        SizedBox(height: 5,),
                        Text(data[index].mood, style: TextStyle(color: Colors.orange),),
                        Text(data[index].color, style: TextStyle(color: Colors.orange),),
                        SizedBox(height: 5,),
                        Flexible(child: Text(data[index].description, style: TextStyle(color: Colors.lightBlue, ),)),

                      ],
                    )
                  ),
                  staggeredTileBuilder:(index)=>StaggeredTile.count(2, index.isEven ? 5 : 3)
              ),
            );
          } ,
          loading: () => AstroShimmer(),
          error: (err, stack)  => Center(child: Text('$err'),)
      ),
    );
  }
}
