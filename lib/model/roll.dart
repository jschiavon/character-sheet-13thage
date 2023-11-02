import 'dart:math';

class Roll {
  int roll;
  int bonus;
  int level;
  String? ability;
  String? stat;
  bool? proficency;

  Roll({
    required this.roll,
    this.bonus = 0,
    this.level = 0,
    this.ability,
    this.stat,
    this.proficency,
  }) {
    if ((ability == null || ability!.isEmpty) &&
        (stat == null || stat!.isEmpty)) {
      throw ArgumentError.value({'ability': ability, 'stat': stat});
    }
    if ((ability != null && ability!.isNotEmpty) &&
        (stat != null && stat!.isNotEmpty)) {
      throw ArgumentError.value({'ability': ability, 'stat': stat});
    }
    if (ability != null && ability!.isNotEmpty) {
      proficency = proficency ?? false;
    }
  }

  Roll.random({
    this.bonus = 0,
    this.level = 0,
    this.ability,
    this.stat,
    this.proficency,
  }) : roll = Random().nextInt(20) + 1;
}
