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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/main_controller.dart';
import '../model/roll.dart';
import '../utilities/utilities.dart';

class RollHistoryView extends GetView<MainCtrl> {
  const RollHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Roll's history")),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: Dimensions.adaptedWidth(context),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 6),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.rolls.count,
              itemBuilder: (context, index) => createRollTile(
                  controller.rolls.rollsList.reversed.toList()[index]),
            ),
          ),
        ),
      ),
    );
  }

  Widget createRollTile(Roll roll) {
    if (roll.damageDie == null) {
      final bonus = roll.bonus + (roll.proficency ?? false ? 4 : 0);
      final totalRoll = roll.roll + bonus + roll.level;
      return ListTile(
        leading: CircleAvatar(
          backgroundColor: Get.theme.colorScheme.primary,
          foregroundColor: Get.theme.colorScheme.onPrimary,
          child: Text(totalRoll.toString()),
        ),
        title: Text(roll.ability ?? roll.stat ?? ''),
        subtitle: Text(
          'Natural roll: ${roll.roll}'
          '  Bonus: $bonus'
          '${roll.proficency ?? false ? ' (Prof)' : ''}'
          '${roll.level > 0 ? "  Level: ${roll.level}" : ""}',
        ),
      );
    } else {
      final totalRoll = roll.roll + roll.bonus;
      return ListTile(
        leading: CircleAvatar(
          backgroundColor: Get.theme.colorScheme.primary,
          foregroundColor: Get.theme.colorScheme.onPrimary,
          child: Text(totalRoll.toString()),
        ),
        title: Text(roll.ability ?? roll.stat ?? ''),
        subtitle: Text(
          'Natural roll: ${roll.roll}'
          '  Bonus: ${roll.bonus}',
        ),
      );
    }
  }
}
