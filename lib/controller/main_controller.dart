import 'package:get/get.dart';

import '../model/abilities.dart';
import '../model/aspects.dart';
import '../model/character.dart';
import '../utilities/database.dart';
import 'abilities.dart';
import 'aspects.dart';
import 'character.dart';
import 'roll.dart';
import 'status.dart';

class MainCtrl extends GetxController {
  final CharacterCtrl character = Get.put(CharacterCtrl());
  final AspectsCtrl aspects = Get.put(AspectsCtrl());
  final AbilitiesCtrl abilities = Get.put(AbilitiesCtrl());
  final StatusCtrl status = Get.put(StatusCtrl());
  final RollsCtrl rolls = Get.put(RollsCtrl());

  final _db = DataBaseHelper().obs;

  @override
  void onInit() async {
    await _db.value.init();

    final charId = await _db.value.getCharacterId();
    if (charId != null) {
      character.characterModel.value = await _db.value.getCharacter(charId);
    } else {
      character.characterModel.value = Character(
        charName: 'Mario',
        charClass: 'Fighter',
        charRace: 'Human',
      );
    }

    final abilId = await _db.value.getAbilitiesId();
    if (abilId != null) {
      abilities.abilitiesModel.value = await _db.value.getAbilities(abilId);
    } else {
      abilities.abilitiesModel.value = Abilities();
    }

    final aspeId = await _db.value.getAspectsId();
    if (aspeId != null) {
      aspects.aspectsModel.value = await _db.value.getAspects(aspeId);
    } else {
      aspects.aspectsModel.value = Aspects(
        origin: 'Raised by the wolves',
        concept: 'Dirty mercenary',
        uniqueThing: 'Heigthened sense of smell',
        bond: 'The pack',
      );
    }

    super.onInit();
  }

  void saveCharacter() async {
    final charId = await _db.value.getCharacterId();
    if (charId == null) {
      await _db.value.insertCharacter(character.characterModel.value);
    } else {
      await _db.value.updateCharacter(character.characterModel.value);
    }
  }

  void saveAbilities() async {
    final abilId = await _db.value.getAbilitiesId();
    if (abilId == null) {
      await _db.value.insertAbilities(abilities.abilitiesModel.value);
    } else {
      await _db.value.updateAbilities(abilities.abilitiesModel.value);
    }
  }

  void saveAspects() async {
    final aspeId = await _db.value.getAspectsId();
    if (aspeId == null) {
      await _db.value.insertAspects(aspects.aspectsModel.value);
    } else {
      await _db.value.updateAspects(aspects.aspectsModel.value);
    }
  }
}
