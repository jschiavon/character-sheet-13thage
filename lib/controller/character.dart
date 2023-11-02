import 'package:get/get.dart';

import '../model/character.dart';

class CharacterCtrl extends GetxController {
  final characterModel = Character().obs;

  void setCharacter(String element, String value) {
    switch (element.toLowerCase()) {
      case 'name':
        characterModel.value = Character(
          id: characterModel.value.id,
          charName: value,
          charRace: characterModel.value.charRace,
          charClass: characterModel.value.charClass,
          charLevel: characterModel.value.charLevel,
        );
      case 'race':
        characterModel.value = Character(
          id: characterModel.value.id,
          charName: characterModel.value.charName,
          charRace: value,
          charClass: characterModel.value.charClass,
          charLevel: characterModel.value.charLevel,
        );
      case 'class':
        characterModel.value = Character(
          id: characterModel.value.id,
          charName: characterModel.value.charName,
          charRace: characterModel.value.charRace,
          charClass: value,
          charLevel: characterModel.value.charLevel,
        );
      case 'level':
        int? valueInt = int.tryParse(value);
        if (valueInt == null) {
          throw ArgumentError.value(value);
        }
        level = valueInt;
      default:
        throw ArgumentError.value(element);
    }
  }

  set level(int value) {
    if (value < 1 || value > 10) {
      characterModel.value = Character(
        id: characterModel.value.id,
        charName: characterModel.value.charName,
        charRace: characterModel.value.charRace,
        charClass: characterModel.value.charClass,
        charLevel: value,
      );
    }
  }

  int get level {
    return characterModel.value.charLevel;
  }

  int get hitPointMultiplier {
    switch (level) {
      case 1:
        return 3;
      case 2:
        return 4;
      case 3:
        return 5;
      case 4:
        return 6;
      case 5:
        return 8;
      case 6:
        return 10;
      case 7:
        return 12;
      case 8:
        return 16;
      case 9:
        return 20;
      case 10:
        return 24;
      default:
        return 0;
    }
  }

  int get abilityMultiplier {
    switch (level) {
      case 1:
      case 2:
      case 3:
      case 4:
        return 1;
      case 5:
      case 6:
      case 7:
        return 2;
      case 8:
      case 9:
      case 10:
        return 3;
      default:
        return 0;
    }
  }

  String characterData(String element) {
    final characterMap = characterModel.value.toMap();
    if (characterMap.keys.contains(element.toLowerCase())) {
      return characterMap[element.toLowerCase()];
    }
    throw ArgumentError.value(element);
  }

  void levelUp() {
    if (level < 10) {
      characterModel.value = Character(
        id: characterModel.value.id,
        charName: characterModel.value.charName,
        charRace: characterModel.value.charRace,
        charClass: characterModel.value.charClass,
        charLevel: level + 1,
      );
    }
  }

  void levelDown() {
    if (level > 1) {
      characterModel.value = Character(
        id: characterModel.value.id,
        charName: characterModel.value.charName,
        charRace: characterModel.value.charRace,
        charClass: characterModel.value.charClass,
        charLevel: level - 1,
      );
    }
  }
}
