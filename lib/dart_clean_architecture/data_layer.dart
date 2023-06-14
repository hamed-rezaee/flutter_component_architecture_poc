import 'domain_layer.dart';

class Model implements BaseModel {}

abstract class BaseDataSource<M extends BaseModel> {}

class DataSource implements BaseDataSource<BaseModel> {}

class Repository implements BaseRepository<BaseEntity, BaseModel> {
  @override
  DataSource get dataSource => throw UnimplementedError();

  @override
  Mapper get mapper => throw UnimplementedError();
}
