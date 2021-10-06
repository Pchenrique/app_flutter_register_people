import 'package:floor/floor.dart';
import 'package:register_people/model/people.dart';
import 'package:register_people/repository/irepository.dart';

@dao
abstract class PeopleRepositoryDAO extends IRepositoryDAO<People> {
  @Query('SELECT * FROM People WHERE id = :id')
  Future<People?> getById(int id);

  @Query('SELECT * FROM People')
  Future<List<People>> getAll();
}