import 'package:flutter/material.dart';
import 'package:punchlist/compartments/assignment.dart';
import 'package:path/path.dart';
import 'package:punchlist/db/database_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Contractors {

  int id;
  String name;
  String email;
  String phone;
  List<Assignment> jobs;

  Contractors({this.id, this.name, this.email, this.phone});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_NAME: name,
      DatabaseProvider.COLUMN_EMAIL: email,
      DatabaseProvider.COLUMN_PHONE: phone,
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }

    return map;
  }

  Contractors.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseProvider.COLUMN_ID];
    name = map[DatabaseProvider.COLUMN_NAME];
    email = map[DatabaseProvider.COLUMN_EMAIL];
    phone = map[DatabaseProvider.COLUMN_PHONE];
  }
}
  Map<String, dynamic> toMap() {
    return {
      'id' : DatabaseProvider.COLUMN_ID,
      'name' : DatabaseProvider.COLUMN_NAME,
      'email' : DatabaseProvider.COLUMN_EMAIL,
      'phone' : DatabaseProvider.COLUMN_PHONE,
    };
  }
//  void main() async {
//    // Avoid errors caused by flutter upgrade.
//    // Importing 'package:flutter/widgets.dart' is required.
//    WidgetsFlutterBinding.ensureInitialized();
//    final database = openDatabase(
//      // Set the path to the database. Note: Using the `join` function from the
//      // `path` package is best practice to ensure the path is correctly
//      // constructed for each platform.
//      join(await getDatabasesPath(), 'doggie_database.db'),
//      // When the database is first created, create a table to store dogs.
//      onCreate: (db, version) {
//        return db.execute(
//          "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
//        );
//      },
//      // Set the version. This executes the onCreate function and provides a
//      // path to perform database upgrades and downgrades.
//      version: 1,
//    );
//  }
//    Future<void> insertSub(Contractors newSub) async {
//      // Get a reference to the database.
//      final Database db = await database;
//
//      // Insert the Dog into the correct table. Also specify the
//      // `conflictAlgorithm`. In this case, if the same dog is inserted
//      // multiple times, it replaces the previous data.
//      await db.insert(
//        'Subs',
//        newSub.toMap(),
//        conflictAlgorithm: ConflictAlgorithm.replace,
//      );
//    }
//
//    Future<List<Contractors>> subList() async {
//      // Get a reference to the database.
//      final Database db = await database;
//
//      // Query the table for all The Dogs.
//      final List<Map<String, dynamic>> maps = await db.query('dogs');
//
//      // Convert the List<Map<String, dynamic> into a List<Dog>.
//      return List.generate(maps.length, (i) {
//        return Contractors(
//          id: maps[i]['id'],
//          name: maps[i]['name'],
//          email: maps[i]['email'],
//          phone: maps[i]['phone'],
//        );
//      });
//    }
//
//    Future<void> updateSub(Contractors newSub) async {
//      // Get a reference to the database.
//      final db = await database;
//
//      // Update the given Dog.
//      await db.update(
//        'Subs',
//        newSub.toMap(),
//        // Ensure that the Dog has a matching id.
//        where: "id = ?",
//        // Pass the Dog's id as a whereArg to prevent SQL injection.
//        whereArgs: [newSub.id],
//      );
//    }
//
//    Future<void> deleteSub(int id) async {
//      // Get a reference to the database.
//      final db = await database;
//
//      // Remove the sub from the database.
//      await db.delete(
//        'subs',
//        // Use a `where` clause to delete a specific dog.
//        where: "id = ?",
//        // Pass the Dog's id as a whereArg to prevent SQL injection.
//        whereArgs: [id],
//      );
//    }
//
//
//
//  // Implement toString to make it easier to see information about
//  // each dog when using the print statement.
//  @override
//  String toString() {
//  return 'Contractor{id: $id, name: $name, email: $email, phone: $phone}';
//  }
