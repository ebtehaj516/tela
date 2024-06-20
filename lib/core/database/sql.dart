import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Sql {
  //create object from database
  Database? _db;

//ensure to found database ore create database if is not found
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initializeDb();
      return _db;
    } else {
      return _db;
    }
  }


  initializeDb() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    //store database in the path
    String path = join(databasesPath, 'Tela.db');
    // open the database
    Database database = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return database;
  }

// Function onCreate
  Future<FutureOr<void>> _onCreate(Database db, int version) async {
    print('Create DB');
    // When creating the db, create the table
   //create table UserInformation
    await db.execute(
        'CREATE TABLE UserInformation(user_id INTEGER PRIMARY KEY, first_name TEXT,last_name TEXT,Password TEXT,Number text,type_user text,score INTEGER)');
    //create table Clothes
    await db.execute(
        'CREATE TABLE Clothes(cloth_id INTEGER PRIMARY KEY, image_clothes TEXT,user_id INTEGER NOT NULL ,FOREIGN KEY (user_id) REFERENCES UserInformation(user_id) )');
    //create table History
    await db.execute(
        'CREATE TABLE History(id INTEGER PRIMARY KEY, name_of_content TEXT,image TEXT ,user_id INTEGER NOT NULL ,FOREIGN KEY (user_id) REFERENCES UserInformation(user_id))');
  }

// Function onUpgrade
  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {
    print("update DB");
  }

  // read or select data from table in the database
  readData(String sql) async {
    Database? database = await db;
    List<Map> res = await database!.rawQuery(sql);
    return res;
  }

  // insert  data to table in the database
  insertData(String sql) async {
    Database? database = await db;
    final res = await database!.rawInsert(sql);
    if (res != 0) {
      return true;
    } else {
      return false;
    }
  }

  // update data table in the database
  updateData(String sql) async {
    Database? database = await db;
    final res = await database!.rawUpdate(sql);
    return res;
  }

  // delete data from table in the database
  deleteData(String sql) async {
    Database? database = await db;
    final res = await database!.rawDelete(sql);
    return res;
  }

  var userId;
  var userType;
  var score;

  //function login  for read data in the table  to know user is founded or not founded
  Future<bool> login(String userName, String password) async {
    Database? database = await initializeDb();
    var result = await database!.rawQuery(
        "SELECT * FROM UserInformation where first_name || last_name = '$userName' And  Password = '$password'  ");
    print(result);
    if (result.isNotEmpty) {
      userId = result.first['user_id'];
      userType = result.first['type_user'];
      //the user is found
      return true;
    } else {
      //the user is n't found
      return false;
    }
  }
  //return user with first_name and last_name is founded
var userIdInserted;
  Future<bool> readUserId(String firstName, String lastName) async {
    Database? database = await initializeDb();
    var result = await database!.rawQuery(
        "SELECT * FROM UserInformation where first_name ='$firstName' And  last_name = '$lastName'  ");
    print(result);
    if (result.isNotEmpty) {
      userIdInserted = result.first['user_id'];
      //the user is found
      return true;
    } else {
      //the user is n't found
      return false;
    }
  }
// read score if user was entered in login
  Future<bool> readUserScore(var userId) async {
    Database? database = await initializeDb();
    var result = await database!
        .rawQuery("SELECT * FROM UserInformation where user_id='$userId'");
    print(result);
    if (result.isNotEmpty) {
      score = result.first['score'];
      //the user is found
      return true;
    } else {
      //the user is n't found
      return false;
    }
  }
}
