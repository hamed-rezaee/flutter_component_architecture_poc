import 'package:example/core/contracts/data/base_model.dart';
import 'package:example/core/contracts/domain/base_entity.dart';

abstract class BaseMapper<E extends BaseEntity, M extends BaseModel> {
  E toEntity(M model);
}
