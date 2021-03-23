

import 'package:netflix/src/blocs/base_bloc.dart';
import 'package:netflix/src/models/item_model.dart';
import 'package:rxdart/rxdart.dart';

class MovieListBloc extends BaseBloc<ItemModel>{
  Observable<ItemModel> get movielist => fetcher.stream;
  fetchMovieList(String type) async{
    ItemModel itemModel = await repository.fetchMovieList(type);
    fetcher.sink.add(itemModel);

  }
}

final movieListBloc = MovieListBloc();