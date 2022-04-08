import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:fl_bloc_abm/models/sports_model.dart';
export 'package:fl_bloc_abm/models/sports_model.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<dynamic> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'test1DB.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Deportes(
            id INTEGER PRIMARY KEY,
            nombre TEXT,
            descripcion TEXT
          )

        ''');
    });
  }

  Future<int> nuevoDato(SportsModel nuevoDato) async {
    final id = nuevoDato.id;
    final nombre = nuevoDato.nombre;
    final descripcion = nuevoDato.descripcion;

    //verificar la db
    final db = await database;

    final res = await db!.rawInsert('''
      INSERT INTO Deportes(id, nombre, descripcion)
        VALUES( $id, '$nombre', '$descripcion' )
      ''');

    return res;
  }

  Future<int> nuevoDatoRaw(SportsModel nuevoDato) async {
    final db = await database;
    final res = await db!.insert('Deportes', nuevoDato.toJson());
    //id del ultimo registro
    return res;
  }

  Future<SportsModel> getDatosById(int id) async {
    final db = await database;
    final res = await db!.query('Deportes', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? SportsModel.fromJson(res.first) : SportsModel(nombre: '', descripcion: '');
  }

  Future<List<SportsModel>> getTodos() async {
    final db = await database;
    final res = await db!.query('Deportes', orderBy: 'id DESC');

    return res.isNotEmpty ? res.map((s) => SportsModel.fromJson(s)).toList() : [];
  }

    Future<SportsModel> getDatosByNombre(String nombre) async {
      final db = await database;
      final res = await db!.rawQuery('''
        SELECT * FROM Deportes WHERE nombre = '$nombre'
      ''');

      return res.isNotEmpty
        ? res.map((s) => SportsModel.fromJson(s)).toList().first
        : SportsModel(nombre: '', descripcion: '');
    }

  Future<int> updateDato(SportsModel nuevoDato) async {
    final db = await database;
    final res = await db!.update('Deportes', nuevoDato.toJson(),
        where: 'id = ?', whereArgs: [nuevoDato.id]);

    return res;
  }

  Future<int> deleteDato(int id) async {
    final db = await database;
    final res = await db!.delete('Deportes', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllDeportes() async {
    final db = await database;
    final res = await db!.delete('Deportes');
    return res;
  }
  
}
