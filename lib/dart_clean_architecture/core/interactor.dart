import 'domain.dart';

abstract class BaseService {
  const BaseService(this.repository);

  final BaseRepository? repository;
}
