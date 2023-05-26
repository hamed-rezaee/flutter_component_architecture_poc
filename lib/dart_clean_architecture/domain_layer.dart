import 'package:dart_clean_architecture/data_layer.dart';

class BaseEntity {}

abstract class BaseRepository<E extends BaseEntity, M extends BaseModel> {
  final BaseMapper mapper;
  final BaseDataSource dataSource;

  BaseRepository(this.mapper, this.dataSource);
}

abstract class BaseService {
  final BaseRepository repository;

  BaseService(this.repository);
}

class Service implements BaseService {}
