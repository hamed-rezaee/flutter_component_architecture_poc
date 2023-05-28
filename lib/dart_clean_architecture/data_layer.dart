import 'package:dart_clean_architecture/dart_clean_architecture/domain_layer.dart';

abstract class BaseModel {}

class Mapper implements BaseMapper {}

class DataSource implements BaseDataSource {}

class Repository implements BaseRepository {
  @override
  BaseDataSource<BaseModel> get dataSource => throw UnimplementedError();

  @override
  BaseMapper<BaseEntity, BaseModel> get mapper => throw UnimplementedError();
}
