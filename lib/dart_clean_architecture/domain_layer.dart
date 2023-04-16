import 'package:dart_clean_architecture/data_layer.dart';

class BaseEntity {}

abstract class BaseRepository<E extends BaseEntity, M extends BaseModel> {
  final BaseMapper mapper;
  final BaseDataStore dataStore;

  BaseRepository(this.mapper, this.dataStore);
}

abstract class BaseService {
  final BaseRepository repository;

  BaseService(this.repository);
}

class Service implements BaseService {}
