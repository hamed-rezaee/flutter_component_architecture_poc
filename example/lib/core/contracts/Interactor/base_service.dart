import '../domain/base_repository.dart';

abstract class BaseService {
  const BaseService(this.repository);

  final BaseRepository? repository;
}
