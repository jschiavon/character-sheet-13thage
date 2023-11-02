// An interactive character sheet built with Flutter and GetX.
// Copyright (C) 2023  Jacopo Schiavon

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/abilities.dart';
import '../model/aspects.dart';
import '../model/character.dart';

class DataBaseHelper {
  static const _databaseName = 'character_database.db';
  static const _databaseVersion = 1;

  static const _abilitiesTable = 'abilities';
  static const _characterTable = 'character';
  static const _aspectsTable = 'aspects';

  static const _id = 'id';
  static const _strength = 'strength';
  static const _dexterity = 'dexterity';
  static const _constitution = 'constitution';
  static const _intelligence = 'intelligence';
  static const _wisdom = 'wisdom';
  static const _charisma = 'charisma';
  static const _racialMod = 'racialMod';
  static const _classMod = 'classMod';

  static const _name = 'name';
  static const _race = 'race';
  static const _class = 'class';
  static const _level = 'level';

  static const _concept = 'concept';
  static const _origin = 'origin';
  static const _uniqueThing = 'uniqueThing';
  static const _bond = 'bond';

  late Database _db;

  // this opens the database (and creates it if it doesn't exist)
  Future<void> init() async {
    final databaseDirectory = await getDatabasesPath();
    final path = join(databaseDirectory, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_characterTable (
            $_id INTEGER PRIMARY KEY,
            $_name TEXT NOT NULL,
            $_race TEXT NOT NULL,
            $_class TEXT NOT NULL,
            $_level INTEGER NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $_aspectsTable (
            $_id INTEGER PRIMARY KEY,
            $_concept TEXT NOT NULL,
            $_origin TEXT NOT NULL,
            $_uniqueThing TEXT NOT NULL,
            $_bond TEXT NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $_abilitiesTable (
            $_id INTEGER PRIMARY KEY,
            $_strength INTEGER NOT NULL,
            $_dexterity INTEGER NOT NULL,
            $_constitution INTEGER NOT NULL,
            $_intelligence INTEGER NOT NULL,
            $_wisdom INTEGER NOT NULL,
            $_charisma INTEGER NOT NULL,
            $_racialMod INTEGER NOT NULL,
            $_classMod INTEGER NOT NULL
          )
          ''');
  }

  Future<Abilities> insertAbilities(Abilities abilities) async {
    abilities.id = await _db.insert(_abilitiesTable, abilities.toDbMap());
    return abilities;
  }

  Future<Character> insertCharacter(Character character) async {
    character.id = await _db.insert(_characterTable, character.toMap());
    return character;
  }

  Future<Aspects> insertAspects(Aspects aspects) async {
    aspects.id = await _db.insert(_aspectsTable, aspects.toMap());
    return aspects;
  }

  Future<int?> getAbilitiesId() async {
    List<Map<String, dynamic>> maps = await _db.query(
      _abilitiesTable,
      columns: [_id],
    );
    return maps.firstOrNull?[_id];
  }

  Future<int?> getAspectsId() async {
    List<Map<String, dynamic>> maps = await _db.query(
      _aspectsTable,
      columns: [_id],
    );
    return maps.firstOrNull?[_id];
  }

  Future<int?> getCharacterId() async {
    List<Map<String, dynamic>> maps = await _db.query(
      _characterTable,
      columns: [_id],
    );
    return maps.firstOrNull?[_id];
  }

  Future<Abilities> getAbilities(int id) async {
    List<Map<String, dynamic>> maps = await _db.query(_abilitiesTable,
        columns: [
          _id,
          _strength,
          _dexterity,
          _constitution,
          _intelligence,
          _wisdom,
          _charisma,
          _racialMod,
          _classMod,
        ],
        where: '$_id = ?',
        whereArgs: [id]);
    return Abilities.fromMap(maps.firstOrNull);
  }

  Future<Character> getCharacter(int id) async {
    List<Map<String, dynamic>> maps = await _db.query(_characterTable,
        columns: [
          _id,
          _name,
          _race,
          _class,
          _level,
        ],
        where: '$_id = ?',
        whereArgs: [id]);
    return Character.fromMap(maps.firstOrNull);
  }

  Future<Aspects> getAspects(int id) async {
    List<Map<String, dynamic>> maps = await _db.query(_aspectsTable,
        columns: [
          _id,
          _concept,
          _origin,
          _uniqueThing,
          _bond,
        ],
        where: '$_id = ?',
        whereArgs: [id]);
    return Aspects.fromMap(maps.firstOrNull);
  }

  Future<int> deleteAbilities(int id) async {
    return await _db.delete(
      _abilitiesTable,
      where: '$_id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteCharacter(int id) async {
    return await _db.delete(
      _characterTable,
      where: '$_id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAspects(int id) async {
    return await _db.delete(
      _aspectsTable,
      where: '$_id = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateAbilities(Abilities abilities) async {
    return await _db.update(
      _abilitiesTable,
      abilities.toDbMap(),
      where: '$_id = ?',
      whereArgs: [abilities.id],
    );
  }

  Future<int> updateCharacter(Character character) async {
    return await _db.update(
      _characterTable,
      character.toMap(),
      where: '$_id = ?',
      whereArgs: [character.id],
    );
  }

  Future<int> updateAspects(Aspects aspects) async {
    return await _db.update(
      _aspectsTable,
      aspects.toMap(),
      where: '$_id = ?',
      whereArgs: [aspects.id],
    );
  }
}
