


import 'package:netflix/src/models/movie_detail_model.dart';
import 'package:netflix/src/blocs/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc extends BaseBloc<MovieDetailModel>{
  Observable<MovieDetailModel> get movieDetail => fetcher.stream;
  fetchMovieList(int movieId) async{
    MovieDetailModel itemModel = await repository.fetchMovieDetail(movieId);
    fetcher.sink.add(itemModel);

  }
}

final movieDetailBloc = MovieDetailBloc();