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
import '../model/abilities.dart';
import '../utilities/utilities.dart';
import '../utilities/lists.dart';

class PointBuyView extends GetView<MainCtrl> {
  PointBuyView({super.key});

  final abilityRaceExpanded = <String>[].obs;
  final abilityClassExpanded = <String>[].obs;

  @override
  Widget build(BuildContext context) {
    if (controller.character.characterData('race').isNotEmpty) {
      abilityRaceExpanded.value =
          RACES[controller.character.characterData('race')]!;
    }
    if (controller.character.characterData('class').isNotEmpty) {
      abilityClassExpanded.value =
          CLASSES[controller.character.characterData('class')]!['abilities'];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Point Buy"),
        backgroundColor: Get.theme.colorScheme.primaryContainer,
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: Dimensions.adaptedWidth(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: title(),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: generateRaceClass(),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                elevation: 0,
                color: Get.theme.colorScheme.primaryContainer,
                child: generateAbilityList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: generateBonusRow(),
            ),
          ],
        ),
      ),
    );
  }

  Widget generateRaceClass() {
    return Flex(
      direction: Dimensions.isSmallScreen ? Axis.vertical : Axis.horizontal,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: raceChoice(),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: classChoice(),
        ),
      ],
    );
  }

  Widget raceChoice() {
    final racesExpanded = RACES.keys.toList();
    racesExpanded.add('');
    return Row(
      children: [
        const Text('Race:'),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: DropdownButtonHideUnderline(
            child: Obx(
              () => DropdownButton<String>(
                value: controller.character.characterData('race'),
                isDense: true,
                items: racesExpanded
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.capitalizeFirst ?? ''),
                      ),
                    )
                    .toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    controller.character.setCharacter('race', newValue);
                    abilityRaceExpanded.value =
                        RACES[controller.character.characterData('race')]!;
                    controller.saveCharacter();
                    controller.abilities.racialBonus = '';
                    controller.saveAbilities();
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget classChoice() {
    final classesExpanded = CLASSES.keys.toList();
    classesExpanded.add('');
    return Row(
      children: [
        const Text('Class:'),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: DropdownButtonHideUnderline(
            child: Obx(
              () => DropdownButton<String>(
                value: controller.character.characterData('class'),
                isDense: true,
                items: classesExpanded
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    controller.character.setCharacter('class', newValue);
                    abilityClassExpanded.value = CLASSES[controller.character
                        .characterData('class')]!['abilities'];
                    controller.saveCharacter();
                    controller.abilities.classBonus = '';
                    controller.saveAbilities();
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget generateAbilityList() {
    return ListView(
      shrinkWrap: true,
      children: abilitiesNames.map((e) => abilityRow(e)).toList(),
    );
  }

  Widget abilityRow(String abilityName) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              abilityName.capitalizeFirst!,
            ),
          ),
          Card(
            elevation: 4,
            color: Get.theme.colorScheme.background,
            surfaceTintColor: Get.theme.colorScheme.background,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: 40,
                child: Text(
                  controller.abilities.printAbilityValue(abilityName),
                  textAlign: TextAlign.center,
                  style: Get.textTheme.titleLarge,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              controller.abilities.printAbilityModifier(abilityName),
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              controller.abilities.printAbilityCost(abilityName),
              style: Get.textTheme.titleMedium,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  controller.abilities.incrementAbility(abilityName);
                  controller.saveAbilities();
                },
                child: Icon(
                  Icons.expand_less,
                  size: Get.textTheme.titleLarge!.fontSize,
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.abilities.decrementAbility(abilityName);
                  controller.saveAbilities();
                },
                child: Icon(
                  Icons.expand_more,
                  size: Get.textTheme.titleLarge!.fontSize,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget title() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 10,
          child: Text(
            'Point buy',
            textAlign: TextAlign.center,
            style: Get.textTheme.displaySmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Obx(
                () => Text(
                  '${28 - controller.abilities.totalCost()}',
                  style: Get.textTheme.titleLarge,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget generateBonusRow() {
    return Flex(
      direction: Dimensions.isSmallScreen ? Axis.vertical : Axis.horizontal,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: racialBonus(),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: classBonus(),
        ),
      ],
    );
  }

  Widget racialBonus() {
    return Row(
      children: [
        const Text('Racial bonus:'),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: DropdownButtonHideUnderline(
            child: Obx(
              () => DropdownButton<String>(
                value: controller.abilities.racialBonus,
                isDense: true,
                items: abilityRaceExpanded
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: e.isEmpty
                            ? const Text('')
                            : Text('+2 ${e.capitalizeFirst}'),
                      ),
                    )
                    .toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    controller.abilities.racialBonus = newValue;
                    controller.saveAbilities();
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget classBonus() {
    return Row(
      children: [
        const Text('Class bonus:'),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: DropdownButtonHideUnderline(
            child: Obx(
              () => DropdownButton<String>(
                value: controller.abilities.classBonus,
                isDense: true,
                items: abilityClassExpanded
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: e.isEmpty
                            ? const Text('')
                            : Text('+2 ${e.capitalizeFirst}'),
                      ),
                    )
                    .toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    controller.abilities.classBonus = newValue;
                    controller.saveAbilities();
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
