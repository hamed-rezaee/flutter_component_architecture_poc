abstract class BaseModel {}

abstract class BaseEntity {}

class Entity implements BaseEntity {}

abstract class BaseMapper<E extends BaseEntity, M extends BaseModel> {}

abstract class BaseDataSource<M extends BaseModel> {}

abstract class BaseRepository<E extends BaseEntity, M extends BaseModel> {
  BaseRepository(this.mapper, this.dataSource);

  final BaseMapper<BaseEntity, BaseModel> mapper;
  final BaseDataSource<BaseModel> dataSource;
}

abstract class BaseService {
  BaseService(this.repository);

  final BaseRepository<BaseEntity, BaseModel> repository;
}
