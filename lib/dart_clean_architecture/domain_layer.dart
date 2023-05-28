import 'package:dart_clean_architecture/dart_clean_architecture/data_layer.dart';

abstract class BaseEntity {}

abstract class BaseMapper<E extends BaseEntity, M extends BaseModel> {}

abstract class BaseDataSource<M extends BaseModel> {}

abstract class BaseRepository<E extends BaseEntity, M extends BaseModel> {
  final BaseMapper mapper;
  final BaseDataSource dataSource;

  BaseRepository(this.mapper, this.dataSource);
}

abstract class BaseService {
  final BaseRepository repository;

  BaseService(this.repository);
}
