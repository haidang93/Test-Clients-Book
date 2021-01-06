// singleton class to manage the database

import 'dart:convert';

import 'package:mutex/mutex.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  // Database table and column names
  static const String tableProfiles = 'profiles';
  static const String tableTopup = 'Topup';
  static const String tableComment = 'comment';
  static const String tableCommentContent = 'comment_content';
  static const String tableTransaction = 'transactions';
  static const String tableBuffComment = 'buffComment';
  static const String tableBuffLike = 'buffLike';
  static const String tableFollow = 'follow';
  static const String tableLikePage = 'likePage';
  static const String tableVIPLikeService = 'VIPLikeService';
  static const String tableWalletLog = 'walletLog';

  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "autolike.db";

  // Increment this version when you need to change the schema.
  static final _databaseVersion = 11;

  // Make this a singleton class.
  DatabaseProvider._();
  Mutex mutex = Mutex();

  static final single = DatabaseProvider._();

  // Only allow a single open connection to the database.
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // Open the database
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future _onInit(Database db) async {
    final batch = db.batch();

    batch.execute('''
    DROP TABLE IF EXISTS $tableProfiles;
    ''');
    batch.execute('''
    CREATE TABLE [$tableProfiles] (
        [single] TEXT NOT NULL PRIMARY KEY,
        [id] TEXT,
        [data] TEXT
    );
    ''');

    batch.execute('''
    DROP TABLE IF EXISTS $tableTopup;
    ''');
    batch.execute('''
    CREATE TABLE [$tableTopup] (
        [id] TEXT NOT NULL PRIMARY KEY,
        [data] TEXT
    );
    ''');

    batch.execute('''
    DROP TABLE IF EXISTS $tableComment;
    ''');
    batch.execute('''
    CREATE TABLE [$tableComment] (
        [id] TEXT NOT NULL PRIMARY KEY,
        [data] TEXT
    );
    ''');

    batch.execute('''
    DROP TABLE IF EXISTS $tableCommentContent;
    ''');
    batch.execute('''
    CREATE TABLE [$tableCommentContent] (
        [id] TEXT NOT NULL PRIMARY KEY,
        [comment_id] TEXT,
        [data] TEXT
    );
    ''');

    batch.execute('''
    DROP TABLE IF EXISTS $tableTransaction;
    ''');
    batch.execute('''
    CREATE TABLE [$tableTransaction] (
        [id] TEXT NOT NULL PRIMARY KEY,
        [data] TEXT
    );
    ''');

    batch.execute('''
    DROP TABLE IF EXISTS $tableBuffComment;
    ''');
    batch.execute('''
    CREATE TABLE [$tableBuffComment] (
        [id] TEXT NOT NULL PRIMARY KEY,
        [data] TEXT
    );
    ''');

    batch.execute('''
    DROP TABLE IF EXISTS $tableBuffLike;
    ''');
    batch.execute('''
    CREATE TABLE [$tableBuffLike] (
        [id] TEXT NOT NULL PRIMARY KEY,
        [data] TEXT
    );
    ''');

    batch.execute('''
    DROP TABLE IF EXISTS $tableFollow;
    ''');
    batch.execute('''
    CREATE TABLE [$tableFollow] (
        [id] TEXT NOT NULL PRIMARY KEY,
        [data] TEXT
    );
    ''');

    batch.execute('''
    DROP TABLE IF EXISTS $tableLikePage;
    ''');
    batch.execute('''
    CREATE TABLE [$tableLikePage] (
        [id] TEXT NOT NULL PRIMARY KEY,
        [data] TEXT
    );
    ''');

    batch.execute('''
    DROP TABLE IF EXISTS $tableVIPLikeService;
    ''');
    batch.execute('''
    CREATE TABLE [$tableVIPLikeService] (
        [id] TEXT NOT NULL PRIMARY KEY,
        [data] TEXT
    );
    ''');

    batch.execute('''
    DROP TABLE IF EXISTS $tableWalletLog;
    ''');
    batch.execute('''
    CREATE TABLE [$tableWalletLog] (
        [id] TEXT NOT NULL PRIMARY KEY,
        [data] TEXT
    );
    ''');

    await batch.commit(noResult: true);
  }

  // Database version is updated, alter the table
  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    _onInit(db);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    _onInit(db);
  }

  Future deleteAll() async {
    // log((await database).path);
    // (await database).close();
    // await deleteDatabase((await database).path);
    // _database = await _initDatabase();
    await ((await openDatabase('autolike.db')).close());
    await deleteDatabase('autolike.db');
    _database = null;
  }

  Future writeToTable(String table, Map<String, dynamic> data) async {
    final db = await database;
    switch (table) {
      case tableProfiles:
        final newData = {
          "single": 1,
          "id": data['id'],
          "data": jsonEncode(data)
        };
        await mutex.protect(() async => await db.insert(table, newData,
            nullColumnHack: '', conflictAlgorithm: ConflictAlgorithm.replace));
        break;
      case tableTopup:
        final newData = {"id": data['id'], "data": jsonEncode(data)};
        await mutex.protect(() async => await db.insert(table, newData,
            nullColumnHack: '', conflictAlgorithm: ConflictAlgorithm.replace));
        break;
      case tableComment:
        final newData = {"id": data['id'], "data": jsonEncode(data)};
        await mutex.protect(() async => await db.insert(table, newData,
            nullColumnHack: '', conflictAlgorithm: ConflictAlgorithm.replace));
        break;
      case tableCommentContent:
        final newData = {
          "id": data['id'],
          "comment_id": data['comment_id'],
          "data": jsonEncode(data)
        };
        await mutex.protect(() async => await db.insert(table, newData,
            nullColumnHack: '', conflictAlgorithm: ConflictAlgorithm.replace));
        break;
      case tableTransaction:
        final newData = {"id": data['id'], "data": jsonEncode(data)};
        await mutex.protect(() async => await db.insert(table, newData,
            nullColumnHack: '', conflictAlgorithm: ConflictAlgorithm.replace));
        break;
      case tableBuffComment:
        final newData = {"id": data['id'], "data": jsonEncode(data)};
        await mutex.protect(() async => await db.insert(table, newData,
            nullColumnHack: '', conflictAlgorithm: ConflictAlgorithm.replace));
        break;
      case tableBuffLike:
        final newData = {"id": data['id'], "data": jsonEncode(data)};
        await mutex.protect(() async => await db.insert(table, newData,
            nullColumnHack: '', conflictAlgorithm: ConflictAlgorithm.replace));
        break;
      case tableFollow:
        final newData = {"id": data['id'], "data": jsonEncode(data)};
        await mutex.protect(() async => await db.insert(table, newData,
            nullColumnHack: '', conflictAlgorithm: ConflictAlgorithm.replace));
        break;
      case tableLikePage:
        final newData = {"id": data['id'], "data": jsonEncode(data)};
        await mutex.protect(() async => await db.insert(table, newData,
            nullColumnHack: '', conflictAlgorithm: ConflictAlgorithm.replace));
        break;
      case tableVIPLikeService:
        final newData = {"id": data['id'], "data": jsonEncode(data)};
        await mutex.protect(() async => await db.insert(table, newData,
            nullColumnHack: '', conflictAlgorithm: ConflictAlgorithm.replace));
        break;
      case tableWalletLog:
        final newData = {"id": data['id'], "data": jsonEncode(data)};
        await mutex.protect(() async => await db.insert(table, newData,
            nullColumnHack: '', conflictAlgorithm: ConflictAlgorithm.replace));
        break;
      default:
    }
  }

  Future<dynamic> getData(Object object, {String commentID}) async {
    final db = await database;
    // switch (object) {
    //   case User:
    //     List<Map<String, dynamic>> data;
    //     await mutex.protect(() async => data = (await db.query(tableProfiles)));
    //     User.single.fromJson(jsonDecode(data.first['data']));
    //     return User.single;
    //     break;
    //   case Package:
    //     List<Map<String, dynamic>> data;
    //     List<Package> list = [];
    //     await mutex.protect(() async => data = await db.query(tableTopup));
    //     for (var item in data) {
    //       list.add(new Package.fromJson(jsonDecode(item['data'])));
    //     }
    //     return list;
    //     break;
    //   case Comment:
    //     List<Map<String, dynamic>> data;
    //     List<Comment> list = [];
    //     await mutex.protect(() async => data = await db.query(tableComment));
    //     for (var item in data) {
    //       list.add(new Comment.fromJson(jsonDecode(item['data'])));
    //     }
    //     return list;
    //     break;
    //   case CommentContent:
    //     List<Map<String, dynamic>> data;
    //     List<CommentContent> list = [];
    //     await mutex.protect(() async => data = await db.query(
    //         tableCommentContent,
    //         where: 'comment_id = ?',
    //         whereArgs: [commentID]));
    //     for (var item in data) {
    //       list.add(new CommentContent.fromJson(jsonDecode(item['data'])));
    //     }
    //     return list;
    //     break;
    //   case Transactions:
    //     List<Map<String, dynamic>> data;
    //     List<Transactions> list = [];
    //     await mutex
    //         .protect(() async => data = await db.query(tableTransaction));
    //     for (var item in data) {
    //       list.add(new Transactions.fromJson(jsonDecode(item['data'])));
    //     }
    //     return list;
    //     break;
    //   case UsedBuffcomment:
    //     List<Map<String, dynamic>> data;
    //     List<UsedBuffcomment> list = [];
    //     await mutex
    //         .protect(() async => data = await db.query(tableBuffComment));
    //     for (var item in data) {
    //       list.add(new UsedBuffcomment.fromJson(jsonDecode(item['data'])));
    //     }
    //     return list;
    //     break;
    //   case UsedBufflike:
    //     List<Map<String, dynamic>> data;
    //     List<UsedBufflike> list = [];
    //     await mutex.protect(() async => data = await db.query(tableBuffLike));
    //     for (var item in data) {
    //       list.add(new UsedBufflike.fromJson(jsonDecode(item['data'])));
    //     }
    //     return list;
    //     break;
    //   case UsedFollow:
    //     List<Map<String, dynamic>> data;
    //     List<UsedFollow> list = [];
    //     await mutex.protect(() async => data = await db.query(tableFollow));
    //     for (var item in data) {
    //       list.add(new UsedFollow.fromJson(jsonDecode(item['data'])));
    //     }
    //     return list;
    //     break;
    //   case UsedLikepage:
    //     List<Map<String, dynamic>> data;
    //     List<UsedLikepage> list = [];
    //     await mutex.protect(() async => data = await db.query(tableLikePage));
    //     for (var item in data) {
    //       list.add(new UsedLikepage.fromJson(jsonDecode(item['data'])));
    //     }
    //     return list;
    //     break;
    //   case UsedViplikeService:
    //     List<Map<String, dynamic>> data;
    //     List<UsedViplikeService> list = [];
    //     await mutex
    //         .protect(() async => data = await db.query(tableVIPLikeService));
    //     for (var item in data) {
    //       list.add(new UsedViplikeService.fromJson(jsonDecode(item['data'])));
    //     }
    //     return list;
    //     break;
    //   case WalletLog:
    //     List<Map<String, dynamic>> data;
    //     List<WalletLog> list = [];
    //     await mutex.protect(() async => data = await db.query(tableWalletLog));
    //     for (var item in data) {
    //       list.add(new WalletLog.fromJson(jsonDecode(item['data'])));
    //     }
    //     return list;
    //     break;
    //   default:
    //     return null;
    // }
  }
}
