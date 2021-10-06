import 'package:floor/floor.dart';

class BaseEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String createdAt;

  BaseEntity(this.id, this.createdAt);
}