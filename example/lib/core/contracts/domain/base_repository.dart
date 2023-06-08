import 'base_data_source.dart';
import '../presentation/base_entity.dart';
import 'base_mapper.dart';
import '../data/base_model.dart';

/// The [BaseRepository] class defines the base repository interface,
/// which encapsulates the data retrieval logic and provides an abstraction for
/// accessing data from the data source.
/// It depends on the [BaseMapper] and [BaseDataSource] interfaces.
abstract class BaseRepository {
  /// Initializes a new instance of [BaseRepository].
  const BaseRepository(this.mapper, this.dataSource);

  /// Mapper instance.
  final BaseMapper<BaseEntity, BaseModel> mapper;

  /// Data source instance.
  final BaseDataSource dataSource;
}
