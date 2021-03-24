import 'package:netflix/src/blocs/base_bloc.dart';
import 'package:netflix/src/models/image_model.dart';
import 'package:netflix/src/models/movie_image_model.dart';
import 'package:rxdart/rxdart.dart';


class ImageBloc extends BaseBloc<MovieImageModel>{
  Observable<MovieImageModel> get movieImages => fetcher.stream;
  fetchMovieList(int movieId) async{
    MovieImageModel itemModel = await repository.fetchMovieImages(movieId);
    fetcher.sink.add(itemModel);
  }
}

final imageBloc = ImageBloc();