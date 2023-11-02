import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../model/abilities.dart';

class AbilitiesCtrl extends GetxController {
  final abilitiesModel = Abilities().obs;

  String get racialBonus => abilitiesModel.value.racialMod >= 0
      ? abilitiesNames[abilitiesModel.value.racialMod]
      : '';

  String get classBonus => abilitiesModel.value.classMod >= 0
      ? abilitiesNames[abilitiesModel.value.classMod]
      : '';

  set racialBonus(String value) {
    abilitiesModel.value = Abilities(
      id: abilitiesModel.value.id,
      strength: abilitiesModel.value.strength,
      dexterity: abilitiesModel.value.dexterity,
      constitution: abilitiesModel.value.constitution,
      intelligence: abilitiesModel.value.intelligence,
      wisdom: abilitiesModel.value.wisdom,
      charisma: abilitiesModel.value.charisma,
      racialMod: value.isEmpty ? abilitiesNames.indexOf(value) : -1,
      classMod: abilitiesModel.value.classMod,
    );
  }

  set classBonus(String value) {
    abilitiesModel.value = Abilities(
      id: abilitiesModel.value.id,
      strength: abilitiesModel.value.strength,
      dexterity: abilitiesModel.value.dexterity,
      constitution: abilitiesModel.value.constitution,
      intelligence: abilitiesModel.value.intelligence,
      wisdom: abilitiesModel.value.wisdom,
      charisma: abilitiesModel.value.charisma,
      racialMod: abilitiesModel.value.racialMod,
      classMod: value.isEmpty ? abilitiesNames.indexOf(value) : -1,
    );
  }

  void setAbility(String ability, int value) {
    switch (ability.toLowerCase()) {
      case 'strength':
        abilitiesModel.value = Abilities(
          id: abilitiesModel.value.id,
          strength: Ability(value),
          dexterity: abilitiesModel.value.dexterity,
          constitution: abilitiesModel.value.constitution,
          intelligence: abilitiesModel.value.intelligence,
          wisdom: abilitiesModel.value.wisdom,
          charisma: abilitiesModel.value.charisma,
          racialMod: abilitiesModel.value.racialMod,
          classMod: abilitiesModel.value.classMod,
        );
      case 'dexterity':
        abilitiesModel.value = Abilities(
          id: abilitiesModel.value.id,
          strength: abilitiesModel.value.strength,
          dexterity: Ability(value),
          constitution: abilitiesModel.value.constitution,
          intelligence: abilitiesModel.value.intelligence,
          wisdom: abilitiesModel.value.wisdom,
          charisma: abilitiesModel.value.charisma,
          racialMod: abilitiesModel.value.racialMod,
          classMod: abilitiesModel.value.classMod,
        );
      case 'constitution':
        abilitiesModel.value = Abilities(
          id: abilitiesModel.value.id,
          strength: abilitiesModel.value.strength,
          dexterity: abilitiesModel.value.dexterity,
          constitution: Ability(value),
          intelligence: abilitiesModel.value.intelligence,
          wisdom: abilitiesModel.value.wisdom,
          charisma: abilitiesModel.value.charisma,
          racialMod: abilitiesModel.value.racialMod,
          classMod: abilitiesModel.value.classMod,
        );
      case 'intelligence':
        abilitiesModel.value = Abilities(
          id: abilitiesModel.value.id,
          strength: abilitiesModel.value.strength,
          dexterity: abilitiesModel.value.dexterity,
          constitution: abilitiesModel.value.constitution,
          intelligence: Ability(value),
          wisdom: abilitiesModel.value.wisdom,
          charisma: abilitiesModel.value.charisma,
          racialMod: abilitiesModel.value.racialMod,
          classMod: abilitiesModel.value.classMod,
        );
      case 'wisdom':
        abilitiesModel.value = Abilities(
          id: abilitiesModel.value.id,
          strength: abilitiesModel.value.strength,
          dexterity: abilitiesModel.value.dexterity,
          constitution: abilitiesModel.value.constitution,
          intelligence: abilitiesModel.value.intelligence,
          wisdom: Ability(value),
          charisma: abilitiesModel.value.charisma,
          racialMod: abilitiesModel.value.racialMod,
          classMod: abilitiesModel.value.classMod,
        );
      case 'charisma':
        abilitiesModel.value = Abilities(
          id: abilitiesModel.value.id,
          strength: abilitiesModel.value.strength,
          dexterity: abilitiesModel.value.dexterity,
          constitution: abilitiesModel.value.constitution,
          intelligence: abilitiesModel.value.intelligence,
          wisdom: abilitiesModel.value.wisdom,
          charisma: Ability(value),
          racialMod: abilitiesModel.value.racialMod,
          classMod: abilitiesModel.value.classMod,
        );
      default:
        throw ArgumentError.value(ability);
    }
  }

  Ability get strength => abilityValue('strength');
  Ability get dexterity => abilityValue('dexterity');
  Ability get constitution => abilityValue('constitution');
  Ability get intelligence => abilityValue('intelligence');
  Ability get wisdom => abilityValue('wisdom');
  Ability get charisma => abilityValue('charisma');

  Ability abilityValue(String ability, {bool clean = false}) {
    if (abilitiesNames.contains(ability.toLowerCase())) {
      Ability abilityValue =
          abilitiesModel.value.toMap()[ability.toLowerCase()]!;
      if (!clean &&
          (ability.toLowerCase() == racialBonus ||
              ability.toLowerCase() == classBonus)) {
        abilityValue += 2;
      }
      return abilityValue;
    }
    throw ArgumentError.value(ability);
  }

  String printAbilityValue(String ability) {
    if (abilitiesNames.contains(ability.toLowerCase())) {
      Ability abilityValue =
          abilitiesModel.value.toMap()[ability.toLowerCase()]!;
      if (ability.toLowerCase() == racialBonus ||
          ability.toLowerCase() == classBonus) {
        abilityValue += 2;
      }
      return abilityValue.printAbility();
    }
    throw ArgumentError.value(ability);
  }

  String printAbilityModifier(String ability) {
    if (abilitiesNames.contains(ability.toLowerCase())) {
      Ability abilityValue =
          abilitiesModel.value.toMap()[ability.toLowerCase()]!;
      if (ability.toLowerCase() == racialBonus ||
          ability.toLowerCase() == classBonus) {
        abilityValue += 2;
      }
      return abilityValue.printModifier();
    }
    throw ArgumentError.value(ability);
  }

  String printAbilityCost(String ability) {
    if (abilitiesNames.contains(ability.toLowerCase())) {
      // return abilities[ability.toLowerCase()]!.printCost();
      return abilitiesModel.value.toMap()[ability.toLowerCase()]!.printCost();
    }
    throw ArgumentError.value(ability);
  }

  int totalCost() {
    int cost = 0;
    // abilities.forEach((key, value) {
    //   cost += value.cost;
    // });
    abilitiesModel.value.toMap().forEach((key, value) {
      cost += value.cost;
    });
    return cost;
  }

  void incrementAbility(String ability) {
    if (totalCost() < 28) {
      if (abilityValue(ability) < 18) {
        setAbility(ability, abilityValue(ability, clean: true).value + 1);
      }
    }
  }

  void decrementAbility(String ability) {
    if (totalCost() > 0) {
      if (abilityValue(ability) > 3) {
        setAbility(ability, abilityValue(ability, clean: true).value - 1);
      }
    }
  }

  List<Ability> roll4d6() {
    final rolled = <Ability>[];
    for (var _ in abilitiesNames) {
      int sum = 0;
      int smallest = 6;
      for (var i = 0; i < 4; i++) {
        int roll = Random().nextInt(6) + 1;
        sum += roll;
        if (roll < smallest) smallest = roll;
      }
      rolled.add(Ability(sum - smallest));
    }
    return rolled;
  }

  Map<String, dynamic> rollAbility(
    String ability, {
    bool proficiency = false,
    int? level,
  }) {
    int bonus = 0;

    bonus += abilityValue(ability).modifier;

    if (proficiency) {
      bonus += 4;
    }
    int roll = Random().nextInt(20) + 1;
    if (kDebugMode) {
      print('Roll: $roll + $bonus + $level = ${roll + bonus + (level ?? 0)}');
    }
    return {
      'ability': ability,
      'roll': roll,
      'bonus': bonus,
      'level': level,
    };
  }
}
