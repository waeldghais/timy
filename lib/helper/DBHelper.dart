import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'schedule.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE schedule(id TEXT PRIMARY KEY,date TEXT,compare TEXT)');
    }, version: 2);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(table, data);
  }

  static Future<List<Map<String, Object>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  static Future<List<Map<String, Object>>> getDataByID(
      String table, String id) async {
    final db = await DBHelper.database();
    return db.query(table, where: 'id=?', whereArgs: [id]);
  }

  static Future<List<Map<String, Object>>> getDataByDate(
      String table, String date) async {
    final db = await DBHelper.database();
    return db.query(table, where: 'compare=?', whereArgs: [date]);
  }

  static Future<void> deleteOldData(String table) async {
    final allData = await getData(table);

    allData.forEach((data) async {
      if (DateTime.now()
          .subtract(Duration(hours: 7))
          .isAfter(DateTime.parse(data['date'])))
        await deleteData(table, data['id']);
    });
  }

  static Future<void> deleteData(String table, String id) async {
    final db = await DBHelper.database();
    db.delete(table, where: 'id=?', whereArgs: [id]);
  }

  static Future<void> updateData(
      String table, String id, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.update(table, data, where: 'id=?', whereArgs: [id]);
  }
}
