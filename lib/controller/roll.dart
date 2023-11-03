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

import 'package:get/get.dart';

import '../model/roll.dart';

class RollsCtrl extends GetxController {
  final rollsList = <Roll>[].obs;

  void roll({
    int bonus = 0,
    int level = 0,
    String? ability,
    String? stat,
    bool? proficency,
  }) {
    rollsList.add(Roll.random(
      bonus: bonus,
      level: level,
      ability: ability,
      stat: stat,
      proficency: proficency,
    ));
  }

  void rollDamage({
    String stat = '',
    int bonus = 0,
    int level = 0,
    int damageDie = 6,
  }) {
    rollsList.add(Roll.randomDamage(
      stat: stat,
      bonus: bonus,
      level: level,
      damageDie: damageDie,
    ));
  }

  int get count => rollsList.length;
}
