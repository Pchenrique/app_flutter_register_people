import 'package:floor/floor.dart';

import 'base_entity.dart';

@entity
class People extends BaseEntity {

  People({ int? id, required String createdAt, required this.name, required this.phone, required this.address }): 
    super(0, '');

  final String name;
  final String phone;
  final String address;
}