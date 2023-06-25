import '../core/data.dart';
import 'domain_layer.dart';

class FeatureModel implements BaseModel {}

abstract class BaseFeatureDataSource implements BaseDataSource {
  Future<FeatureModel> getData();
}

class RemoteFeatureDataSource implements BaseFeatureDataSource {
  @override
  Future<FeatureModel> getData() async => FeatureModel();
}

class LocalFeatureDataSource implements BaseFeatureDataSource {
  @override
  Future<FeatureModel> getData() async => FeatureModel();
}

class FeatureRepository implements BaseFeatureRepository {
  @override
  BaseFeatureDataSource get dataSource => throw UnimplementedError();

  @override
  FeatureMapper get mapper => throw UnimplementedError();
}
