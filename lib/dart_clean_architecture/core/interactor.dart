import 'domain.dart';

abstract class BaseService {
  /// Initializes a new instance of [BaseService].
  const BaseService(this.repository);

  /// Repository instance.
  final BaseRepository? repository;
}
