import 'data_layer.dart';

abstract class BaseModel {}

abstract class BaseEntity {}

class Entity implements BaseEntity {}

class Mapper implements BaseMapper<BaseEntity, BaseModel> {}

abstract class BaseMapper<E extends BaseEntity, M extends BaseModel> {}

abstract class BaseRepository<E extends BaseEntity, M extends BaseModel> {
  BaseRepository(this.mapper, this.dataSource);

  final BaseMapper<BaseEntity, BaseModel> mapper;
  final BaseDataSource<BaseModel> dataSource;
}
