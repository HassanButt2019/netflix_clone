import 'package:netflix/src/models/base_model.dart';
import 'package:netflix/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';


abstract class BaseBloc<T extends BaseModel>{
  final repository = Repository();
  final fetcher = PublishSubject<T>();

  dispose(){
    fetcher.close();
  }
}