import 'package:example/core/contracts/data/base_model.dart';
import 'package:example/core/contracts/domain/base_entity.dart';

/// The [BaseMapper] class defines the base mapper interface,
/// which specifies the mapping behavior between domain entities and data models.
abstract class BaseMapper<E extends BaseEntity, M extends BaseModel> {
  /// Maps a model to an entity.
  E toEntity(M model);
}
