import 'package:flutter/material.dart';
import 'package:netflix/src/blocs/movie_list_bloc.dart';
import 'package:netflix/src/models/item_model.dart';

class MovieList extends StatefulWidget {
  final String type;
  final Function(int movieId) onItemInteraction;

  MovieList({Key key, this.type, this.onItemInteraction}) : super(key: key);
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    movieListBloc.fetchMovieList(widget.type);
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
      height: width / 1.75,
      margin: EdgeInsets.only(top: 20, bottom: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.results.length > 10
              ? 10
              : snapshot.data.results.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                if (widget.onItemInteraction != null) {
                  widget.onItemInteraction(snapshot.data.results[index].id);
                } else {
                  debugPrint("No Handle");
                }
              },
              child: _buildItem(
                  snapshot.data.results[index].poster_path,
                  snapshot.data.results[index].backdrop_path,
                  width / 4,
                  index == 0),
            );
          }),
    );
  }

  _buildItem(
      String imagePath, String backdrop_path, double itemHeight, bool isFirst) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10,
      margin: EdgeInsets.only(left: isFirst ? 20 : 10, right: 10, bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Image.network(
        "https://image.tmbd.org/t/p/w500$imagePath",
        fit: BoxFit.cover,
        width: itemHeight * 4 / 3,
        height: itemHeight / 2,
      ),
    );
  }
}
