import 'package:floor/floor.dart';
import 'package:register_people/model/base_entity.dart';

abstract class IRepositoryDAO<Model extends BaseEntity> {
  @insert
  Future<int> insertItem(Model item);

  @update
  Future<int> updateItem(Model item);

  @delete
  Future<int> deleteItem(Model item);
}