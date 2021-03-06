
import 'package:flutter/material.dart';
import 'package:netflix/src/blocs/movie_image_bloc.dart';
import 'package:netflix/src/blocs/movie_list_bloc.dart';
import 'package:netflix/src/models/movie_image_model.dart';

class MovieGallery extends StatefulWidget {
  final int movieId;
  MovieGallery({Key key , this.movieId }):super(key:key);
  @override
  _MovieGalleryState createState() => _MovieGalleryState();
}

class _MovieGalleryState extends State<MovieGallery> {
  @override
  Widget build(BuildContext context) {
    imageBloc.fetchMovieList(widget.movieId);
    return  StreamBuilder(
        stream: imageBloc.movieImages,
        builder: (BuildContext context, AsyncSnapshot<MovieImageModel> snapshot) {
          if (snapshot.hasData) {
            return buildContent(snapshot, context);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Container(
            padding: EdgeInsets.all(20),
            child: Center(child: CircularProgressIndicator()),
          );
        });

  }

  Widget buildContent(AsyncSnapshot<MovieImageModel> snapshot, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: width / 3,
      margin: EdgeInsets.only(top: 10, bottom: 50),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.posters.length > 10
              ? 10
              : snapshot.data.posters.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(
                snapshot.data.posters[index].file_path,
                width / 3,
                index == 0);

          }),
    );
  }
  _buildItem(
      String imagePath, double itemHeight, bool isFirst) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10,
      margin: EdgeInsets.only(left: isFirst ? 0 : 10, right: 10, bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Image.network(
        "http://image.tmbd.org/t/p/w500$imagePath",
        fit: BoxFit.cover,
        width: itemHeight * 4 / 3,
        height: itemHeight / 2,
      ),
    );
  }
}
