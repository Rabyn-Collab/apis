import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ex/models/movie_model.dart';
import 'package:get_it/get_it.dart';

class MovieTile extends StatelessWidget {
  final double height;
  final double width;
  final Movie movie;

  MovieTile({this.movie, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    final GetIt getIt = GetIt.instance;
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _moviePoster(movie.posterPath),
          _movieInfo()
        ],
      ),
    );
  }

  Widget _movieInfo() {
    return Container(
      height: height,
      width: width * 0.66,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * 0.56,
                child: Text(
                  movie.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                '${movie.rating}',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, height * 0.02, 0, 0),
            child: Text(
              '${movie.language} | R: ${movie.isAdult}| ${movie.releaseYear}',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, height * 0.07, 0, 0),
            child: Text(
              '${movie.description}',
              overflow: TextOverflow.ellipsis,
              maxLines: 9,
              style: TextStyle(color: Colors.white70, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _moviePoster(String _imageUrl) {
    return Container(
      height: height,
      width: width * 0.35,
      decoration:
          BoxDecoration(image: DecorationImage(image: NetworkImage(_imageUrl))),
    );
  }
}
