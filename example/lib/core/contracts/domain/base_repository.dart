import 'package:example/core/contracts/data/base_data_source.dart';
import 'package:example/core/contracts/data/base_model.dart';
import 'package:example/core/contracts/domain/base_entity.dart';
import 'package:example/core/contracts/domain/base_mapper.dart';

abstract class BaseRepository {
  const BaseRepository(this.mapper, this.dataSource);

  final BaseMapper<BaseEntity, BaseModel>? mapper;

  final BaseDataSource? dataSource;
}
