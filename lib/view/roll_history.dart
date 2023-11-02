import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/main_controller.dart';
import '../model/roll.dart';
import '../utilities/utilities.dart';

class RollHistoryView extends GetView<MainCtrl> {
  const RollHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Roll's history")),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: Dimensions.adaptedWidth,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 6),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.rolls.count,
              itemBuilder: (context, index) => createRollTile(
                  controller.rolls.rollsList.reversed.toList()[index]),
            ),
          ),
        ),
      ),
    );
  }

  Widget createRollTile(Roll roll) {
    final bonus = roll.bonus + (roll.proficency ?? false ? 4 : 0);
    final totalRoll = roll.roll + bonus + roll.level;
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Get.theme.colorScheme.primary,
        foregroundColor: Get.theme.colorScheme.onPrimary,
        child: Text(totalRoll.toString()),
      ),
      title: Text(roll.ability ?? roll.stat ?? ''),
      subtitle: Text(
        'Natural roll: ${roll.roll}'
        '  Bonus: ${bonus}'
        '${roll.proficency ?? false ? ' (Prof)' : ''}'
        '${roll.level > 0 ? "  Level: ${roll.level}" : ""}',
      ),
    );
    // final totalRoll = roll.roll + roll.bonus + roll.level;
    // return ListTile(
    //   leading: CircleAvatar(
    //     backgroundColor: Get.theme.colorScheme.primary,
    //     foregroundColor: Get.theme.colorScheme.onPrimary,
    //     child: Text(totalRoll.toString()),
    //   ),
    //   title: Text(roll.ability ?? roll.stat ?? ''),
    //   subtitle: Text(
    //       'Natural roll: ${roll.roll}   Bonus: ${roll.bonus.toSignedString()}${roll.level > 0 ? "   Level: ${roll.level}" : ""}'),
    // );
  }
}
