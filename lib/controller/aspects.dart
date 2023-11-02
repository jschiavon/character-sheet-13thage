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
          uniqueThing: aspectsModel.value.uniqueThing,
        );
      case 'origin':
        aspectsModel.value = Aspects(
          id: aspectsModel.value.id,
          concept: aspectsModel.value.concept,
          origin: value,
          bond: aspectsModel.value.bond,
          uniqueThing: aspectsModel.value.uniqueThing,
        );
      case 'bond':
        aspectsModel.value = Aspects(
          id: aspectsModel.value.id,
          concept: aspectsModel.value.concept,
          origin: aspectsModel.value.origin,
          bond: value,
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
