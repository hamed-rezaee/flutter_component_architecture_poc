import '../core/data.dart';
import '../core/domain.dart';
import 'data_layer.dart';

class FeatureEntity implements BaseEntity {}

class FeatureMapper implements BaseMapper<BaseEntity, BaseModel> {
  @override
  BaseModel toModel(BaseEntity entity) => throw UnimplementedError();

  @override
  BaseEntity toEntity(BaseModel model) => throw UnimplementedError();
}

abstract class BaseFeatureRepository implements BaseRepository {
  @override
  BaseDataSource get dataSource => throw UnimplementedError();

  @override
  FeatureMapper get mapper => throw UnimplementedError();
}
