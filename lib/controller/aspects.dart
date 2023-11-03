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

import '../model/aspects.dart';

class AspectsCtrl extends GetxController {
  final aspectsModel = Aspects().obs;

  void setAspect(String aspect, String value) {
    switch (aspect) {
      case 'concept':
        aspectsModel.value = Aspects(
          id: aspectsModel.value.id,
          concept: value,
          origin: aspectsModel.value.origin,
          bond: aspectsModel.value.bond,
          weakness: aspectsModel.value.weakness,
          uniqueThing: aspectsModel.value.uniqueThing,
        );
      case 'origin':
        aspectsModel.value = Aspects(
          id: aspectsModel.value.id,
          concept: aspectsModel.value.concept,
          origin: value,
          bond: aspectsModel.value.bond,
          weakness: aspectsModel.value.weakness,
          uniqueThing: aspectsModel.value.uniqueThing,
        );
      case 'bond':
        aspectsModel.value = Aspects(
          id: aspectsModel.value.id,
          concept: aspectsModel.value.concept,
          origin: aspectsModel.value.origin,
          bond: value,
          weakness: aspectsModel.value.weakness,
          uniqueThing: aspectsModel.value.uniqueThing,
        );
      case 'weakness':
        aspectsModel.value = Aspects(
          id: aspectsModel.value.id,
          concept: aspectsModel.value.concept,
          origin: aspectsModel.value.origin,
          bond: aspectsModel.value.bond,
          weakness: value,
          uniqueThing: aspectsModel.value.uniqueThing,
        );
      case 'uniqueThing':
      case 'unique thing':
      case 'one unique thing':
        aspectsModel.value = Aspects(
          id: aspectsModel.value.id,
          concept: aspectsModel.value.concept,
          origin: aspectsModel.value.origin,
          bond: aspectsModel.value.bond,
          weakness: aspectsModel.value.weakness,
          uniqueThing: value,
        );
      default:
        throw ArgumentError.value(aspect);
    }
  }

  String aspect(String aspect) {
    final aspectsMap = aspectsModel.value.toMap();
    if (aspectsMap.keys.contains(aspect)) {
      return aspectsMap[aspect];
    }
    throw ArgumentError.value(aspect);
  }
}
