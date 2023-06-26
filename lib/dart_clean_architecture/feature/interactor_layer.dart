import '../core/interactor.dart';
import 'domain_layer.dart';

abstract class BaseFeatureService implements BaseService {
  @override
  BaseFeatureRepository? get repository => throw UnimplementedError();

  Future<FeatureEntity?> getData();
}

class FeatureService implements BaseFeatureService {
  @override
  BaseFeatureRepository? get repository => throw UnimplementedError();

  @override
  Future<FeatureEntity?> getData() async =>
      throw UnimplementedError(); // repository?.mapper.toEntity(await repository?.dataSource.getData());
}
