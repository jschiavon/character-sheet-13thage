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

class RollAbilitiesView extends GetView<MainCtrl> {
  RollAbilitiesView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();

  final rolled = <Ability>[].obs;
  final abilities = <String>[].obs;

  @override
  Widget build(BuildContext context) {
    abilities.value = abilitiesNames;
    rolled.value = abilitiesNames
        .map(
          (e) => controller.abilities.abilityValue(e),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Roll abilities"),
        backgroundColor: Get.theme.colorScheme.primaryContainer,
      ),
      body: body(),
    );
  }

  Widget body() {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: Dimensions.adaptedWidth,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 0,
                color: Get.theme.colorScheme.primaryContainer,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    generateAbilityList(),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          rolled.value = controller.abilities.roll4d6();
                        },
                        child: const Text("Roll 4d6"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            rolledValues()
          ],
        ),
      ),
    );
  }

  Widget generateAbilityList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: abilitiesNames.map((e) => abilityRow(e)).toList(),
      ),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 40,
              child: Text(
                controller.abilities.printAbilityModifier(abilityName),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rolledValues() {
    return Obx(
      () => Flex(
        direction: Dimensions.isSmallScreen ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        children: rolled
            .map(
              (element) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  element.printAbility(),
                  style: Get.textTheme.headlineLarge,
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget roll() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ElevatedButton(
            onPressed: () {
              rolled.value = controller.abilities.roll4d6();
            },
            child: const Text("Roll 4d6"),
          ),
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: rolled
                .map(
                  (element) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(element.printAbility()),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
