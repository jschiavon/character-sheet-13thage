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

import '../model/status.dart';

class StatusCtrl extends GetxController {
  final statusModel = Status().obs;

  int get damage => statusModel.value.damage;
  int get recoveries => statusModel.value.recoveriesSpent;
  bool get staggered => statusModel.value.staggered;
  bool get dead => statusModel.value.dead;
  bool get down => statusModel.value.down;

  set damage(int value) => statusModel.value = Status(
        id: statusModel.value.id,
        damage: value,
        recoveriesSpent: statusModel.value.recoveriesSpent,
        staggered: statusModel.value.staggered,
        down: statusModel.value.down,
        dead: statusModel.value.dead,
      );
  set recoveries(int value) => statusModel.value = Status(
        id: statusModel.value.id,
        damage: statusModel.value.damage,
        recoveriesSpent: value,
        staggered: statusModel.value.staggered,
        down: statusModel.value.down,
        dead: statusModel.value.dead,
      );

  void toggleStaggered() => statusModel.value = Status(
        id: statusModel.value.id,
        damage: statusModel.value.damage,
        recoveriesSpent: statusModel.value.recoveriesSpent,
        staggered: !statusModel.value.staggered,
        down: statusModel.value.down,
        dead: statusModel.value.dead,
      );
  void toggleDead() => statusModel.value = Status(
        id: statusModel.value.id,
        damage: statusModel.value.damage,
        recoveriesSpent: statusModel.value.recoveriesSpent,
        staggered: statusModel.value.staggered,
        down: statusModel.value.down,
        dead: !statusModel.value.dead,
      );
  void toggleDown() => statusModel.value = Status(
        id: statusModel.value.id,
        damage: statusModel.value.damage,
        recoveriesSpent: statusModel.value.recoveriesSpent,
        staggered: statusModel.value.staggered,
        down: !statusModel.value.down,
        dead: statusModel.value.dead,
      );
}
