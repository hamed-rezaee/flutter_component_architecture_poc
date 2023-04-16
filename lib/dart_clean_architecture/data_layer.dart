import 'package:dart_clean_architecture/domain_layer.dart';

class BaseModel {}

abstract class BaseDataStore<M extends BaseModel> {}

class DataStore implements BaseDataStore {}

abstract class BaseMapper<E extends BaseEntity, M extends BaseModel> {}

class Repository implements BaseRepository {}

class Mapper implements BaseMapper {}
