import 'package:dart_clean_architecture/domain_layer.dart';

class BaseModel {}

abstract class BaseDataSource<M extends BaseModel> {}

class DataSource implements BaseDataSource {}

abstract class BaseMapper<E extends BaseEntity, M extends BaseModel> {}

class Repository implements BaseRepository {}

class Mapper implements BaseMapper {}
