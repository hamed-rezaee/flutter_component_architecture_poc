import 'package:dart_clean_architecture/dart_clean_architecture/bloc_manager.dart';
import 'package:dart_clean_architecture/dart_clean_architecture/domain_layer.dart';

class Entity implements BaseEntity {}

class Service implements BaseService {
  @override
  BaseRepository<BaseEntity, BaseModel> get repository =>
      throw UnimplementedError();
}

class ExtendedBloc extends Bloc implements StateListener {
  ExtendedBloc(super.service);

  @override
  void onState() {}
}

class Bloc {
  Bloc(this.service);

  final BaseService service;
}

class Widget {}

class Page {
  Page(this.bloc, this.widget);

  final ExtendedBloc bloc;
  final Widget widget;
}
