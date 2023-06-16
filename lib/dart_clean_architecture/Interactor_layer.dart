import 'domain_layer.dart';

abstract class BaseService {
  BaseService(this.repository);

  final BaseRepository<BaseEntity, BaseModel>? repository;
}

class Service implements BaseService {
  @override
  BaseRepository<BaseEntity, BaseModel>? get repository =>
      throw UnimplementedError();
}
