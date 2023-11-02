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

import 'dart:math';

class Roll {
  int roll;
  int bonus;
  int level;
  String? ability;
  String? stat;
  bool? proficency;

  Roll({
    required this.roll,
    this.bonus = 0,
    this.level = 0,
    this.ability,
    this.stat,
    this.proficency,
  }) {
    if ((ability == null || ability!.isEmpty) &&
        (stat == null || stat!.isEmpty)) {
      throw ArgumentError.value({'ability': ability, 'stat': stat});
    }
    if ((ability != null && ability!.isNotEmpty) &&
        (stat != null && stat!.isNotEmpty)) {
      throw ArgumentError.value({'ability': ability, 'stat': stat});
    }
    if (ability != null && ability!.isNotEmpty) {
      proficency = proficency ?? false;
    }
  }

  Roll.random({
    this.bonus = 0,
    this.level = 0,
    this.ability,
    this.stat,
    this.proficency,
  }) : roll = Random().nextInt(20) + 1;
}
