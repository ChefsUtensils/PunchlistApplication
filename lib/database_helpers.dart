import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

// database table and column names
final String tableSubs = 'subsTable';
final String columnId = '_id';
final String columnName = 'Name';
final String columnPhone = 'phone';
final String columnEmail = 'email';

// data model class
class SubsStorage {

  int id;
  String name;
  String phone;
  String email;

  SubsStorage();

  // convenience constructor to create a Word object
  SubsStorage.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    phone = map[columnPhone];
    email = map[columnEmail];
  }

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnPhone: phone,
      columnEmail: email,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}

// singleton class to manage the database
class DatabaseHelper {

  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "SubcontractorsDatabase.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableSubs($columnId INTEGER PRIMARY KEY,$columnName TEXT,$columnPhone TEXT,$columnEmail TEXT)"
    );
  }

  // Database helper methods:

  Future<int> insert(SubsStorage storage) async {
    Database db = await database;
    int id = await db.insert(tableSubs, storage.toMap());
    return id;
  }

  Future<SubsStorage> querySub(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tableSubs,
        columns: [columnId, columnName, columnPhone, columnEmail],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return SubsStorage.fromMap(maps.first);
    }
    return null;
  }

// TODO: queryAllWords()
// TODO: delete(int id)
// TODO: update(Word word)
}