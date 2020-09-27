import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:punchlist/SubcontractorPage/contractors.dart';
class DatabaseProvider {
  static const String TABLE_SUBS = 'subsTable';
  static const String COLUMN_ID = '_id';
  static const String COLUMN_NAME = 'name';
  static const String COLUMN_PHONE = 'phone';
  static const String COLUMN_EMAIL = 'email';

  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    print("database getter call");

    if(_database != null){
      return _database;
    }

    _database = await createDatabase();

    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'subcontractorDB.db'),
      version: 1,
      onCreate: (Database data, int version) async {
        print("Creating sub table");

        await database.execute( //this is where I get my error
          "CREATE TABLE $TABLE_SUBS ("
              "$COLUMN_ID INTEGER PRIMARY KEY,"
              "$COLUMN_NAME TEXT,"
              "$COLUMN_EMAIL TEXT,"
              "$COLUMN_PHONE TEXT"
              ")",
        );
      },
    );
  }

  Future<List<Contractors>> getContractors() async {
    final db = await database;

    var subcons = await db.query(
        TABLE_SUBS,
        columns: [COLUMN_ID, COLUMN_NAME, COLUMN_PHONE, COLUMN_EMAIL]
    );

    List<Contractors> subsList = List<Contractors>();

    subcons.forEach((currentContractor) {
      Contractors contractors = Contractors.fromMap(currentContractor);
      subsList.add(contractors);
    });

    return subsList;
  }

  Future<Contractors> insert (Contractors sub) async {
    final db = await database;
    sub.id = await db.insert(TABLE_SUBS, sub.toMap());
    return sub;
  }


}