// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDatabaseApp {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseAppBuilder databaseBuilder(String name) =>
      _$DatabaseAppBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseAppBuilder inMemoryDatabaseBuilder() =>
      _$DatabaseAppBuilder(null);
}

class _$DatabaseAppBuilder {
  _$DatabaseAppBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DatabaseAppBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DatabaseAppBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DatabaseApp> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DatabaseApp();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DatabaseApp extends DatabaseApp {
  _$DatabaseApp([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PeopleRepositoryDAO? _peopleRepositoryDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `People` (`name` TEXT NOT NULL, `phone` TEXT NOT NULL, `address` TEXT NOT NULL, `id` INTEGER PRIMARY KEY AUTOINCREMENT, `createdAt` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PeopleRepositoryDAO get peopleRepositoryDAO {
    return _peopleRepositoryDAOInstance ??=
        _$PeopleRepositoryDAO(database, changeListener);
  }
}

class _$PeopleRepositoryDAO extends PeopleRepositoryDAO {
  _$PeopleRepositoryDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _peopleInsertionAdapter = InsertionAdapter(
            database,
            'People',
            (People item) => <String, Object?>{
                  'name': item.name,
                  'phone': item.phone,
                  'address': item.address,
                  'id': item.id,
                  'createdAt': item.createdAt
                }),
        _peopleUpdateAdapter = UpdateAdapter(
            database,
            'People',
            ['id'],
            (People item) => <String, Object?>{
                  'name': item.name,
                  'phone': item.phone,
                  'address': item.address,
                  'id': item.id,
                  'createdAt': item.createdAt
                }),
        _peopleDeletionAdapter = DeletionAdapter(
            database,
            'People',
            ['id'],
            (People item) => <String, Object?>{
                  'name': item.name,
                  'phone': item.phone,
                  'address': item.address,
                  'id': item.id,
                  'createdAt': item.createdAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<People> _peopleInsertionAdapter;

  final UpdateAdapter<People> _peopleUpdateAdapter;

  final DeletionAdapter<People> _peopleDeletionAdapter;

  @override
  Future<People?> getById(int id) async {
    return _queryAdapter.query('SELECT * FROM People WHERE id = ?1',
        mapper: (Map<String, Object?> row) => People(
            id: row['id'] as int?,
            createdAt: row['createdAt'] as String,
            name: row['name'] as String,
            phone: row['phone'] as String,
            address: row['address'] as String),
        arguments: [id]);
  }

  @override
  Future<List<People>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM People',
        mapper: (Map<String, Object?> row) => People(
            id: row['id'] as int?,
            createdAt: row['createdAt'] as String,
            name: row['name'] as String,
            phone: row['phone'] as String,
            address: row['address'] as String));
  }

  @override
  Future<int> insertItem(People item) {
    return _peopleInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItem(People item) {
    return _peopleUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(People item) {
    return _peopleDeletionAdapter.deleteAndReturnChangedRows(item);
  }
}
