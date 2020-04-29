import 'dart:async';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static final DatabaseHelper _instance = DatabaseHelper.getInstance();
  DatabaseHelper.getInstance();

  factory DatabaseHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if(_db != null) {
      return _db;
    }
    _db = await _initDb();
    return _db;
  }

  Future _initDb() async {
      String databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'sua_carteira_investimentos.db');
      print("db ${path}");
      var db = await openDatabase(path, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
      return db;
  }

  Future<FutureOr<void>> _onCreate(Database db, int version) async {
    var s = await rootBundle.loadString("assets/sql/create.sql");
    List<String> sqls = s.split(";");
    for(String sql in sqls) {
      if(sql.trim().isNotEmpty) {
        print("sql : $sql");
        await db.execute(sql);
      }
    }
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {
    print("onUpgrade oldVersion: $oldVersion: > newVersion: $newVersion");
    db.execute("alter table carro add column NOVA TEXT");
    if(oldVersion == 1 && newVersion == 2)  {
    }
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }


}