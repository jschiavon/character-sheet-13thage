import 'package:get/get.dart';

import '../model/status.dart';

class StatusCtrl extends GetxController {
  final statusModel = Status().obs;

  int get damage => statusModel.value.damage;
  int get recoveries => statusModel.value.recoveriesSpent;
  bool get staggered => statusModel.value.staggered;
  bool get dead => statusModel.value.dead;
  bool get down => statusModel.value.down;

  set damage(int value) => statusModel.value = Status(
        id: statusModel.value.id,
        damage: value,
        recoveriesSpent: statusModel.value.recoveriesSpent,
        staggered: statusModel.value.staggered,
        down: statusModel.value.down,
        dead: statusModel.value.dead,
      );
  set recoveries(int value) => statusModel.value = Status(
        id: statusModel.value.id,
        damage: statusModel.value.damage,
        recoveriesSpent: value,
        staggered: statusModel.value.staggered,
        down: statusModel.value.down,
        dead: statusModel.value.dead,
      );

  void toggleStaggered() => statusModel.value = Status(
        id: statusModel.value.id,
        damage: statusModel.value.damage,
        recoveriesSpent: statusModel.value.recoveriesSpent,
        staggered: !statusModel.value.staggered,
        down: statusModel.value.down,
        dead: statusModel.value.dead,
      );
  void toggleDead() => statusModel.value = Status(
        id: statusModel.value.id,
        damage: statusModel.value.damage,
        recoveriesSpent: statusModel.value.recoveriesSpent,
        staggered: statusModel.value.staggered,
        down: statusModel.value.down,
        dead: !statusModel.value.dead,
      );
  void toggleDown() => statusModel.value = Status(
        id: statusModel.value.id,
        damage: statusModel.value.damage,
        recoveriesSpent: statusModel.value.recoveriesSpent,
        staggered: statusModel.value.staggered,
        down: !statusModel.value.down,
        dead: statusModel.value.dead,
      );
}
