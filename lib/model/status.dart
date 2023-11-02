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

class Status {
  int id;
  final int damage;
  final int recoveriesSpent;
  final bool staggered;
  final bool down;
  final bool dead;

  Status({
    this.id = 0,
    this.damage = 0,
    this.recoveriesSpent = 0,
    this.staggered = false,
    this.down = false,
    this.dead = false,
  });

  factory Status.fromMap(Map<String, dynamic>? statusMap) {
    return Status(
      id: statusMap?['id'] ?? 0,
      damage: statusMap?['damage'] ?? 0,
      recoveriesSpent: statusMap?['recoveriesSpent'] ?? 0,
      staggered: statusMap?['staggered'] ?? false,
      down: statusMap?['down'] ?? false,
      dead: statusMap?['dead'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'damage': damage,
      'recoveriesSpent': recoveriesSpent,
      'staggered': staggered,
      'down': down,
      'dead': dead,
    };
  }
}
