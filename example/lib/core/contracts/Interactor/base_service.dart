import 'package:example/core/contracts/domain/base_repository.dart';

abstract class BaseService {
  const BaseService(this.repository);

  final BaseRepository? repository;
}
