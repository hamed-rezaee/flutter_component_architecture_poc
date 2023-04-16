import 'package:dart_clean_architecture/domain_layer.dart';

class Bloc {
  final BaseService service;

  Bloc(this.service);
}

class Widget {}

class Page {
  final Bloc bloc;
  final Widget widget;

  Page(this.bloc, this.widget);
}
