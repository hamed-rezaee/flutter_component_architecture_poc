import 'data.dart';

abstract class BaseEntity {}

abstract class BaseMapper<E extends BaseEntity, M extends BaseModel> {
  E toEntity(M model);

  M toModel(E entity);
}

abstract class BaseRepository {
  const BaseRepository(this.mapper, this.dataSource);

  final BaseMapper<BaseEntity, BaseModel>? mapper;

  final BaseDataSource? dataSource;
}
