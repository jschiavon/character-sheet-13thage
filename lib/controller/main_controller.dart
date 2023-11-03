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
        weakness: 'Uncivilized',
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
