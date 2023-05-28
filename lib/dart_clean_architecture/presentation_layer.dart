import 'package:dart_clean_architecture/dart_clean_architecture/bloc_manager.dart';
import 'package:dart_clean_architecture/dart_clean_architecture/domain_layer.dart';

class Service implements BaseService {
  @override
  BaseRepository get repository => throw UnimplementedError();
}

class ExtendedBloc extends Bloc implements StateListener {
  ExtendedBloc(super.service);

  @override
  void onState() {}
}

class Bloc {
  final BaseService service;

  Bloc(this.service);
}

class Widget {}

class Page {
  final ExtendedBloc bloc;
  final Widget widget;

  Page(this.bloc, this.widget);
}
