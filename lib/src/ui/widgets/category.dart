import 'package:flutter/material.dart';
import 'package:netflix/src/blocs/movie_list_bloc.dart';
import 'package:netflix/src/constant/global.dart';
import 'package:netflix/src/models/item_model.dart';

class MovieCategory extends StatefulWidget {
  @override
  _MovieCategoryState createState() => _MovieCategoryState();
}

class _MovieCategoryState extends State<MovieCategory> {
  @override
  Widget build(BuildContext context) {
    movieListBloc.fetchMovieList(MovieListType.upcomming);
    return StreamBuilder(
        stream: movieListBloc.movielist,
        builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
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

  Widget buildContent(AsyncSnapshot<ItemModel> snapshot, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: width / 4,
      margin: EdgeInsets.only(top: 20, bottom: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.results.length > 10
              ? 10
              : snapshot.data.results.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(
                  snapshot.data.results[index].release_date,
                  snapshot.data.results[index].backdrop_path,
                  width / 3,
                  index == 0);

          }),
    );
  }
  _buildItem(
      String imagePath, String category, double itemHeight, bool isFirst) {
    return Container(
      width: itemHeight*4/3,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        margin: EdgeInsets.only(left: isFirst ? 20 : 10, right: 10, bottom: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context , BoxConstraints constraint){
            return Stack(
              children: [
                Image.network(
                  "http://image.tmbd.org/t/p/w500$imagePath",
                  fit: BoxFit.cover,
                  width: constraint.biggest.width,
                  height: constraint.biggest.height,
                ),
                Container(
                  alignment: Alignment.center,
                    width: constraint.biggest.width,
                    height: constraint.biggest.height,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child:Text(category , style: TextStyle(color: Colors.white , fontSize: 18),)
                  ),

                ),
              ],
            );
          },
        )
      ),
    );
  }
}
