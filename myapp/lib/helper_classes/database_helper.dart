import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import "package:sqflite/sqflite.dart";
import "package:path_provider/path_provider.dart";

class DatabaseHelper {
  static final _databaseName = "TaskDatabase.db";
  static final _databaseVersion = 1;

  static final table = "task_table";

  static final columnId = 'id';
  static final columnTask = "task";
  static final columnDescription = "description";
  static final columnCategory = "category";

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnTask TEXT NOT NULL,
            $columnDescription TEXT NOT NULL,
            $columnCategory TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }




  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
  
  //Deletes the selected row
  //Query via id
  Future deleteRow(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId =?', whereArgs: [id]);
  }

   //Query via category
  Future selectCategory(String category) async {
    Database db = await instance.database;
    return await db.query(table, where: '$columnCategory =?',whereArgs: [category]);
  }
}
