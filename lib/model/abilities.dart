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

import '../utilities/utilities.dart';

final abilitiesNames = [
  'strength',
  'dexterity',
  'constitution',
  'intelligence',
  'wisdom',
  'charisma',
];

class Abilities {
  int id;
  final Ability strength;
  final Ability dexterity;
  final Ability constitution;
  final Ability wisdom;
  final Ability intelligence;
  final Ability charisma;
  final int racialMod;
  final int classMod;

  Abilities({
    this.id = 0,
    this.strength = const Ability(8),
    this.dexterity = const Ability(8),
    this.constitution = const Ability(8),
    this.wisdom = const Ability(8),
    this.intelligence = const Ability(8),
    this.charisma = const Ability(8),
    this.racialMod = -1,
    this.classMod = -1,
  });

  factory Abilities.fromMap(Map<String, dynamic>? abilitiesMap) {
    if (abilitiesMap == null) {
      return Abilities();
    }
    for (var ability in abilitiesNames) {
      assert(abilitiesMap.keys.contains(ability));
    }
    assert(abilitiesMap.keys.contains('id'));
    assert(abilitiesMap.keys.contains('racialMod'));
    assert(abilitiesMap.keys.contains('classMod'));
    return Abilities(
      id: abilitiesMap['id']!,
      strength: Ability(abilitiesMap['strength']!),
      dexterity: Ability(abilitiesMap['dexterity']!),
      constitution: Ability(abilitiesMap['constitution']!),
      intelligence: Ability(abilitiesMap['intelligence']!),
      wisdom: Ability(abilitiesMap['wisdom']!),
      charisma: Ability(abilitiesMap['charisma']!),
      racialMod: abilitiesMap['racialMod'],
      classMod: abilitiesMap['classMod'],
    );
  }

  Map<String, Ability> toMap() {
    return {
      'strength': strength,
      'dexterity': dexterity,
      'constitution': constitution,
      'wisdom': wisdom,
      'intelligence': intelligence,
      'charisma': charisma,
    };
  }

  Map<String, int?> toDbMap() {
    return {
      'id': id,
      'strength': strength.value,
      'dexterity': dexterity.value,
      'constitution': constitution.value,
      'wisdom': wisdom.value,
      'intelligence': intelligence.value,
      'charisma': charisma.value,
      'racialMod': racialMod,
      'classMod': classMod,
    };
  }
}

class Ability {
  final int value;

  const Ability([this.value = 8]);

  int get modifier {
    switch (value) {
      case 21:
      case 20:
        return 5;
      case 19:
      case 18:
        return 4;
      case 17:
      case 16:
        return 3;
      case 15:
      case 14:
        return 2;
      case 13:
      case 12:
        return 1;
      case 9:
      case 8:
        return -1;
      case 7:
      case 6:
        return -2;
      case 5:
      case 4:
        return -3;
      case 3:
        return -4;
      default:
        return 0;
    }
  }

  int get cost {
    switch (value) {
      case 18:
        return 16;
      case 17:
        return 13;
      case 16:
        return 10;
      case 15:
        return 8;
      case 14:
        return 6;
      case 13:
        return 5;
      case 12:
        return 4;
      case 11:
        return 3;
      case 10:
        return 2;
      case 9:
        return 1;
      case 7:
        return -1;
      case 6:
        return -2;
      case 5:
        return -3;
      case 4:
        return -4;
      case 3:
        return -5;
      default:
        return 0;
    }
  }

  String printAbility() => '$value';

  String printModifier() => modifier.toSignedString();

  String printCost() => '$cost';

  Ability operator +(int v) => Ability(value + v);
  Ability operator -(int v) => Ability(value - v);

  bool operator <(int other) => value < other;
  bool operator >(int other) => value > other;
}

int statCalculator({
  required Ability first,
  required Ability second,
  required Ability third,
}) {
  if (first.modifier > second.modifier) {
    if (second.modifier > third.modifier) {
      return second.modifier;
    } else if (first.modifier > third.modifier) {
      return third.modifier;
    } else {
      return first.modifier;
    }
  } else {
    if (first.modifier > third.modifier) {
      return first.modifier;
    } else if (second.modifier > third.modifier) {
      return third.modifier;
    } else {
      return second.modifier;
    }
  }
}
