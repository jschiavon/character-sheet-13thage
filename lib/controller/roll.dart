import 'package:get/get.dart';

import '../model/roll.dart';

class RollsCtrl extends GetxController {
  final rollsList = <Roll>[].obs;

  void roll({
    int bonus = 0,
    int level = 0,
    String? ability,
    String? stat,
    bool? proficency,
  }) {
    rollsList.add(Roll.random(
      bonus: bonus,
      level: level,
      ability: ability,
      stat: stat,
      proficency: proficency,
    ));
  }

  int get count => rollsList.length;
}
