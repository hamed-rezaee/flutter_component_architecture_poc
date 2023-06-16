import 'Interactor_layer.dart';
import 'bloc_manager.dart';

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
