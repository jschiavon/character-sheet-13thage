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

class Character {
  int id;
  String charName;
  String charRace;
  String charClass;
  int charLevel;

  Character({
    this.id = 0,
    this.charName = '',
    this.charRace = '',
    this.charClass = '',
    this.charLevel = 1,
  });

  factory Character.fromMap(Map<String, dynamic>? characterMap) {
    return Character(
        id: characterMap?['id'] ?? 0,
        charName: characterMap?['name'] ?? '',
        charRace: characterMap?['race'] ?? '',
        charClass: characterMap?['class'] ?? '',
        charLevel: characterMap?['level'] ?? 1);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': charName,
      'race': charRace,
      'class': charClass,
      'level': charLevel,
    };
  }
}
