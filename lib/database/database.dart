import 'dart:async';

import 'package:floor/floor.dart';
import 'package:register_people/model/people.dart';
import 'package:register_people/repository/people_repository.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [People])
abstract class DatabaseApp extends FloorDatabase {
  PeopleRepositoryDAO get peopleRepositoryDAO;
}