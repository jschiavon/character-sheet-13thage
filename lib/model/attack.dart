import 'dart:math';

import '../utilities/utilities.dart';

class Attack {
  int dice;
  int modifier;
  int level;
  int multiplier;
  int? miss;

  Attack({
    required this.dice,
    this.modifier = 0,
    this.level = 1,
    this.multiplier = 1,
    this.miss,
  });

  int get attackBonus => modifier + level;

  String printDamage() {
    String result =
        '${level}d$dice ${(multiplier * modifier).toSignedString()}';
    // if (miss != null) {
    //   result += ' ($miss)';
    // }
    return result;
  }

  int get damageModifier => multiplier * modifier;

  int get averageDamage {
    return (level * dice / 2).ceil() + multiplier * modifier;
  }

  int rollDamage() {
    int damage = multiplier * modifier;
    for (var i = 0; i < level; i++) {
      damage += Random().nextInt(dice) + 1;
    }
    return damage;
  }
}
