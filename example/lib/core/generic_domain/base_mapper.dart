import 'base_entity.dart';
import 'base_model.dart';

/// The [BaseMapper] class defines the base mapper interface,
/// which specifies the mapping behavior between domain entities and data models.
abstract class BaseMapper<E extends BaseEntity, M extends BaseModel> {
  /// Maps an entity to a model.
  M toModel(E entity);

  /// Maps a model to an entity.
  E toEntity(M model);
}
