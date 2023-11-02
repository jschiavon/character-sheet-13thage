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
