import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/main_controller.dart';
import '../model/abilities.dart';
import '../model/roll.dart';
import '../utilities/lists.dart';
import '../utilities/utilities.dart';

class Home extends GetView<MainCtrl> {
  Home({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.colorScheme.primaryContainer,
        title: Obx(
          () => Text(
            "${controller.character.characterData('name')}'s sheet",
            overflow: TextOverflow.fade,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.isDarkMode
                ? Get.changeThemeMode(ThemeMode.light)
                : Get.changeThemeMode(ThemeMode.dark),
            icon: Get.isDarkMode
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
            tooltip: Get.isDarkMode ? 'light mode'.tr : 'dark mode'.tr,
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: body(),
      ),
    );
  }

  Widget body() {
    return SizedBox(
      width: Dimensions.adaptedWidth,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            characterDataSection(),
            aspectsSection(),
            abilitiesSection(),
            statsSection(),
            rollsSection(),
          ],
        ),
      ),
    );
  }

  Widget characterDataSection() {
    return Card(
      elevation: 0,
      color: Get.theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ExpansionTile(
          title: Text(
            "Character data",
            style: Get.textTheme.titleLarge,
          ),
          children: [
            Obx(
              () => createDataTile(
                label: 'name'.capitalizeFirst!,
                value: controller.character.characterData('name'),
                edit: () async {
                  final result = await editField(
                    'name'.capitalizeFirst!,
                    controller.character.characterData('name'),
                  );
                  if (result != null) {
                    controller.character.setCharacter('name', result);
                    controller.saveCharacter();
                  }
                },
              ),
            ),
            Obx(
              () => createDataTile(
                label: 'race'.capitalizeFirst!,
                value: controller.character.characterData('race'),
                edit: () async {
                  final result = await editField(
                    'race'.capitalizeFirst!,
                    controller.character.characterData('race'),
                    possibleValues: RACES.keys.toList(),
                  );
                  if (result != null) {
                    controller.character.setCharacter('race', result);
                    controller.saveCharacter();
                  }
                },
              ),
            ),
            Obx(
              () => createDataTile(
                label: 'class'.capitalizeFirst!,
                value: controller.character.characterData('class'),
                edit: () async {
                  final result = await editField(
                    'class'.capitalizeFirst!,
                    controller.character.characterData('class'),
                    possibleValues: CLASSES.keys.toList(),
                  );
                  if (result != null) {
                    controller.character.setCharacter('class', result);
                    controller.saveCharacter();
                  }
                },
              ),
            ),
            Obx(
              () => createDataTile(
                label: 'level'.capitalizeFirst!,
                value: controller.character.level.toString(),
                levelUp: controller.character.level < 10
                    ? () {
                        controller.character.levelUp();
                        controller.saveCharacter();
                      }
                    : null,
                levelDown: controller.character.level > 1
                    ? () {
                        controller.character.levelDown();
                        controller.saveCharacter();
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget aspectsSection() {
    return Card(
      elevation: 0,
      color: Get.theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ExpansionTile(
          title: Text(
            "Aspects",
            style: Get.textTheme.titleLarge,
          ),
          children: [
            Obx(
              () => createDataTile(
                label: 'concept'.capitalizeFirst!,
                value: controller.aspects.aspect('concept'),
                edit: () async {
                  final result = await editField(
                    'concept'.capitalizeFirst!,
                    controller.aspects.aspect('concept'),
                  );
                  if (result != null) {
                    controller.aspects.setAspect('concept', result);
                    controller.saveAspects();
                  }
                },
              ),
            ),
            Obx(
              () => createDataTile(
                label: 'origin'.capitalizeFirst!,
                value: controller.aspects.aspect('origin'),
                edit: () async {
                  final result = await editField(
                    'origin'.capitalizeFirst!,
                    controller.aspects.aspect('origin'),
                  );
                  if (result != null) {
                    controller.aspects.setAspect('origin', result);
                    controller.saveAspects();
                  }
                },
              ),
            ),
            Obx(
              () => createDataTile(
                label: 'one unique thing'.capitalizeFirst!,
                value: controller.aspects.aspect('uniqueThing'),
                edit: () async {
                  final result = await editField(
                    'one unique thing'.capitalizeFirst!,
                    controller.aspects.aspect('uniqueThing'),
                  );
                  if (result != null) {
                    controller.aspects.setAspect('uniqueThing', result);
                    controller.saveAspects();
                  }
                },
              ),
            ),
            Obx(
              () => createDataTile(
                label: 'bond'.capitalizeFirst!,
                value: controller.aspects.aspect('bond'),
                edit: () async {
                  final result = await editField(
                    'bond'.capitalizeFirst!,
                    controller.aspects.aspect('bond'),
                  );
                  if (result != null) {
                    controller.aspects.setAspect('bond', result);
                    controller.saveAspects();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget abilitiesSection() {
    var abilitiesList = <Widget>[
      TextButton(
        onPressed: () => Get.toNamed('/pointBuy'),
        child: const Text('Point buy'),
      ),
    ];
    abilitiesList.addAll(
      abilitiesNames.map(
        (e) => Obx(
          () => createAbilityTile(
            label: e.capitalizeFirst!,
            value: controller.abilities.printAbilityValue(
              e,
            ),
            modifier: controller.abilities.printAbilityModifier(
              e,
            ),
          ),
        ),
      ),
    );
    return Card(
      elevation: 0,
      color: Get.theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ExpansionTile(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  "Abilities",
                  style: Get.textTheme.titleLarge,
                ),
              ),
            ],
          ),
          children: abilitiesList,
        ),
      ),
    );
  }

  Widget statsSection() {
    return Card(
      elevation: 0,
      color: Get.theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ExpansionTile(
          title: Text(
            'Stats',
            style: Get.textTheme.titleLarge,
          ),
          children: [
            Obx(
              () => Card(
                elevation: 3,
                color: controller.status.down
                    ? Get.theme.colorScheme.errorContainer
                    : Get.theme.colorScheme.background,
                surfaceTintColor: Get.theme.colorScheme.background,
                child: ListTile(
                  title: Text(
                    computeHP(),
                    style: Get.textTheme.headlineLarge,
                  ),
                  subtitle: Text(
                    'Hit Point',
                    style: Get.textTheme.labelMedium,
                  ),
                  leading: Icon(
                    Icons.favorite_outline,
                    color: controller.status.down
                        ? Get.theme.colorScheme.error
                        : null,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        // padding: const EdgeInsets.all(0),
                        visualDensity: VisualDensity.compact,
                        icon: Icon(
                          Icons.favorite,
                          color: controller.status.down
                              ? Get.theme.colorScheme.error
                              : null,
                        ),
                        onPressed:
                            remainingRecoveries() > 0 ? spendRecovery : null,
                      ),
                      Text(
                          'Remaining ${remainingRecoveries()} / ${classDict!['recoveries']}')
                    ],
                  ),
                  onTap: () => Get.dialog(addDamage()),
                ),
              ),
            ),
            Obx(
              () => Card(
                elevation: 3,
                color: Get.theme.colorScheme.background,
                surfaceTintColor: Get.theme.colorScheme.background,
                child: ListTile(
                  title: Text(
                    computeStat('ac').toSignedString(),
                    style: Get.textTheme.headlineLarge,
                  ),
                  subtitle: Text(
                    'Armor Class',
                    style: Get.textTheme.labelMedium,
                  ),
                  leading: const Icon(Icons.shield_outlined),
                  onTap: () => controller.rolls.roll(
                    ability: 'Armor Class',
                    bonus: computeStat('ac'),
                    level: controller.character.level,
                  ),
                ),
              ),
            ),
            Obx(
              () => Card(
                elevation: 3,
                color: Get.theme.colorScheme.background,
                surfaceTintColor: Get.theme.colorScheme.background,
                child: ListTile(
                  title: Text(
                    computeStat('pd').toSignedString(),
                    style: Get.textTheme.headlineLarge,
                  ),
                  subtitle: Text(
                    'Physical Defense',
                    style: Get.textTheme.labelMedium,
                  ),
                  leading: const Icon(Icons.security_outlined),
                  onTap: () => controller.rolls.roll(
                    ability: 'Physical Defense',
                    bonus: computeStat('pd'),
                    level: controller.character.level,
                  ),
                ),
              ),
            ),
            Obx(
              () => Card(
                elevation: 3,
                color: Get.theme.colorScheme.background,
                surfaceTintColor: Get.theme.colorScheme.background,
                child: ListTile(
                  title: Text(
                    computeStat('md').toSignedString(),
                    style: Get.textTheme.headlineLarge,
                  ),
                  subtitle: Text(
                    'Mental Defense',
                    style: Get.textTheme.labelMedium,
                  ),
                  leading: const Icon(Icons.local_police_outlined),
                  onTap: () => controller.rolls.roll(
                    ability: 'Mental Defense',
                    bonus: computeStat('md'),
                    level: controller.character.level,
                  ),
                ),
              ),
            ),
            Obx(
              () => Card(
                elevation: 3,
                color: Get.theme.colorScheme.background,
                surfaceTintColor: Get.theme.colorScheme.background,
                child: ListTile(
                  title: Text(
                    computeStat('init').toSignedString(),
                    style: Get.textTheme.headlineLarge,
                  ),
                  subtitle: Text(
                    'Initiative',
                    style: Get.textTheme.labelMedium,
                  ),
                  leading: const Icon(Icons.bolt_outlined),
                  onTap: () => controller.rolls.roll(
                    ability: 'Initiative',
                    bonus: computeStat('init'),
                    level: controller.character.level,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rollsSection() {
    return Obx(
      () => Card(
        elevation: 0,
        color: Get.theme.colorScheme.primaryContainer,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Text(
                        "Rolls",
                        style: Get.textTheme.titleLarge,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed('/rollHistory'),
                      child: const Text("History"),
                    ),
                  ],
                ),
              ),
              createRollTile(controller.rolls.rollsList.lastOrNull)
            ],
          ),
        ),
      ),
    );
  }

  Widget createRollTile(Roll? roll) {
    if (roll != null) {
      final bonus = roll.bonus + (roll.proficency ?? false ? 4 : 0);
      final totalRoll = roll.roll + bonus + roll.level;
      return Card(
        elevation: 3,
        color: Get.theme.colorScheme.background,
        surfaceTintColor: Get.theme.colorScheme.background,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Get.theme.colorScheme.primary,
            foregroundColor: Get.theme.colorScheme.onPrimary,
            child: Text(totalRoll.toString()),
          ),
          title: Text(roll.ability ?? roll.stat ?? ''),
          subtitle: Text(
            'Natural roll: ${roll.roll}'
            '  Bonus: ${bonus}'
            '${roll.proficency ?? false ? ' (Prof)' : ''}'
            '${roll.level > 0 ? "  Level: ${roll.level}" : ""}',
          ),
        ),
      );
    }
    return Container();
  }

  Widget createDataTile({
    String label = '',
    String value = '',
    void Function()? levelUp,
    void Function()? levelDown,
    void Function()? edit,
  }) {
    bool isLevel = levelUp != null || levelDown != null;
    return Card(
      elevation: 3,
      color: Get.theme.colorScheme.background,
      surfaceTintColor: Get.theme.colorScheme.background,
      child: ListTile(
        isThreeLine: false,
        title: Center(
          child: Text(
            value,
            style: Get.textTheme.headlineSmall,
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
        ),
        subtitle: Text(
          label,
          style: Get.textTheme.labelSmall,
        ),
        trailing: isLevel
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: levelUp,
                    child: Icon(
                      Icons.expand_less,
                      size: Get.textTheme.titleLarge!.fontSize,
                    ),
                  ),
                  GestureDetector(
                    onTap: levelDown,
                    child: Icon(
                      Icons.expand_more,
                      size: Get.textTheme.titleLarge!.fontSize,
                    ),
                  ),
                ],
              )
            : IconButton(
                onPressed: edit,
                icon: const Icon(
                  Icons.edit_outlined,
                ),
              ),
      ),
    );
  }

  Widget createAbilityTile({
    String label = '',
    String value = '',
    String modifier = '',
  }) {
    return Card(
      elevation: 3,
      color: Get.theme.colorScheme.background,
      surfaceTintColor: Get.theme.colorScheme.background,
      child: ListTile(
        title: Text(
          modifier,
          style: Get.textTheme.headlineLarge,
          // overflow: TextOverflow.fade,
          // softWrap: false,
        ),
        subtitle: Text(
          label,
          style: Get.textTheme.labelMedium,
        ),
        leading: Text(
          value,
          style: Get.textTheme.titleLarge,
        ),
        onTap: () => controller.rolls.roll(
          ability: label,
          bonus: controller.abilities.abilityValue(label).modifier,
          level: controller.character.level,
        ),
        trailing: IconButton(
          tooltip: 'Roll ability with proficiency',
          onPressed: () => controller.rolls.roll(
            ability: label,
            bonus: controller.abilities.abilityValue(label).modifier,
            level: controller.character.level,
            proficency: true,
          ),
          icon: Icon(Icons.check_box_outlined),
        ),
      ),
    );
  }

  Future<String?> editField(
    label,
    value, {
    List<String>? possibleValues,
  }) async {
    if (possibleValues != null) {
      possibleValues.add('');
    }
    String newValue = value;
    return Get.dialog<String?>(
      AlertDialog(
        title: Text(label),
        content: Form(
          key: formKey,
          child: possibleValues == null
              ? TextFormField(
                  initialValue: value,
                  decoration: InputDecoration(
                    helperText: label,
                    border: const UnderlineInputBorder(),
                  ),
                  onSaved: (String? nV) {
                    if (nV != null) {
                      newValue = nV;
                    }
                  },
                )
              : DropdownButton<String>(
                  value: newValue,
                  isDense: true,
                  items: possibleValues
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text('${e.capitalizeFirst}'),
                        ),
                      )
                      .toList(),
                  onChanged: (String? nV) {
                    if (nV != null) {
                      newValue = nV;
                    }
                  },
                ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                formKey.currentState!.save();
                Get.back(result: newValue);
              }
            },
            icon: const Icon(Icons.check_outlined),
            label: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  int computeStat(String stat) {
    int baseValue = 10;
    if (controller.character.characterData('class').isNotEmpty) {
      baseValue = classDict!['stats'][stat] ?? 12;
    }

    int modifier = 0;
    switch (stat) {
      case 'ac':
        modifier = statCalculator(
          first: controller.abilities.abilityValue('constitution'),
          second: controller.abilities.abilityValue('dexterity'),
          third: controller.abilities.abilityValue('wisdom'),
        );
        break;
      case 'pd':
        modifier = statCalculator(
          first: controller.abilities.abilityValue('constitution'),
          second: controller.abilities.abilityValue('dexterity'),
          third: controller.abilities.abilityValue('strength'),
        );
        break;
      case 'md':
        modifier = statCalculator(
          first: controller.abilities.abilityValue('intelligence'),
          second: controller.abilities.abilityValue('charisma'),
          third: controller.abilities.abilityValue('wisdom'),
        );
        break;
      case 'init':
        modifier = controller.abilities.abilityValue('dexterity').modifier;
      default:
    }

    int statistic = baseValue + modifier + controller.character.level - 12;
    return statistic;
  }

  String computeHP() {
    int hp = (classDict!['hp'] + controller.abilities.constitution.modifier) *
        controller.character.hitPointMultiplier;

    if (controller.status.damage >= hp) {
      controller.status.damage = hp;
      if (!controller.status.down) {
        controller.status.toggleDown();
      }
    }
    if (controller.status.damage < hp) {
      if (controller.status.down) {
        controller.status.toggleDown();
      }
    }

    return '${hp - controller.status.damage} / $hp';
  }

  Widget addDamage() {
    final damage = 0.obs;
    return AlertDialog(
      scrollable: true,
      title: const Text("Add damage"),
      content: Card(
        elevation: 3,
        color: Get.theme.colorScheme.background,
        surfaceTintColor: Get.theme.colorScheme.background,
        child: ListTile(
          isThreeLine: false,
          title: Center(
            child: Obx(
              () => Text(
                damage.value.toString(),
                style: Get.textTheme.headlineSmall,
                overflow: TextOverflow.fade,
                softWrap: false,
              ),
            ),
          ),
          subtitle: Text(
            'Damage',
            style: Get.textTheme.labelSmall,
          ),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => damage.value += 1,
                child: Icon(
                  Icons.expand_less,
                  size: Get.textTheme.titleLarge!.fontSize,
                ),
              ),
              GestureDetector(
                onTap: () => damage.value -= 1,
                child: Icon(
                  Icons.expand_more,
                  size: Get.textTheme.titleLarge!.fontSize,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              controller.status.damage += damage.value;
              Get.back();
            },
            child: Text('Confirm'))
      ],
    );
  }

  void spendRecovery({int number = 1, bool average = true}) {
    int recoveryDice = classDict!['recovery dice'];
    int recAmount = 0;
    if (average) {
      recAmount += (recoveryDice ~/ 2 + 1) * controller.character.level;
    } else {
      for (var i = 0; i < controller.character.level; i++) {
        recAmount += (Random().nextInt(recoveryDice) + 1);
      }
    }
    recAmount += controller.abilities.constitution.modifier *
        controller.character.abilityMultiplier;
    for (var i = 0; i < number; i++) {
      if (remainingRecoveries() > 0) {
        controller.status.damage -= recAmount;
        controller.status.recoveries = controller.status.recoveries + 1;
        if (controller.status.damage <= 0) {
          controller.status.damage = 0;
          break;
        }
      }
    }
  }

  get classDict {
    return CLASSES[controller.character.characterData('class')]!;
  }

  int remainingRecoveries() {
    return classDict['recoveries'] - controller.status.recoveries;
  }
}
