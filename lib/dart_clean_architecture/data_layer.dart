import 'package:dart_clean_architecture/dart_clean_architecture/domain_layer.dart';

class Model implements BaseModel {}

class Mapper implements BaseMapper<BaseEntity, BaseModel> {}

class DataSource implements BaseDataSource<BaseModel> {}

class Repository implements BaseRepository<BaseEntity, BaseModel> {
  @override
  DataSource get dataSource => throw UnimplementedError();

  @override
  Mapper get mapper => throw UnimplementedError();
}
