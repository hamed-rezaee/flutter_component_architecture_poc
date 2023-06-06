import 'base_repository.dart';

/// The [BaseService] class defines the base service interface,
/// which encapsulates the business logic operations.
/// It depends on the [BaseRepository] interface.
abstract class BaseService {
  /// Initializes a new instance of [BaseService].
  const BaseService(this.repository);

  /// Repository instance.
  final BaseRepository repository;
}
