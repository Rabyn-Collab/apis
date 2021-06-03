import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
class Items{
  final String imageUrl;
  final String route;
  Items({this.route, this.imageUrl});
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



   List<Items> _images = [
    Items(imageUrl: 'assets/exchange.png', route: '/rates'),
    Items(imageUrl: 'assets/corona.png', route: '/corona'),
    Items(imageUrl: 'assets/NASa.jpg', route: '/nasa'),
    Items(imageUrl: 'assets/aztro.jpg', route: '/astro'),
   ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 180,
        flexibleSpace: Container(
          decoration:
          BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/apis.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              itemCount: _images.length,
              itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, _images[index].route);
                    },
                      child: Image.asset(_images[index].imageUrl, fit: BoxFit.cover, height: 500,))),
              staggeredTileBuilder:(index)=>StaggeredTile.count(2, index.isEven ? 2.5 : 1.5)
          ),
        )
    );
  }
}
