import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';

import 'controller/main_controller.dart';
import 'view/home.dart';
import 'view/point_buy.dart';
import 'view/roll_history.dart';
// import 'view/roll.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  final MainCtrl controller = Get.put(MainCtrl());

  runApp(
    GetMaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      // debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => Home(),
          binding: CharacterBindings(),
        ),
        GetPage(
          name: '/pointBuy',
          page: () => PointBuyView(),
          binding: CharacterBindings(),
        ),
        GetPage(
          name: '/rollHistory',
          page: () => const RollHistoryView(),
          binding: CharacterBindings(),
        ),
        // GetPage(
        //   name: '/rollAbilities',
        //   page: () => RollAbilitiesView(),
        //   binding: CharacterBindings(),
        // )
      ],
    ),
  );
}

class CharacterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainCtrl>(() => MainCtrl());
  }
}
