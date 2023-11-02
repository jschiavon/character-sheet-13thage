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

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimensions {
  static double get fullWidth {
    return MediaQuery.of(Get.context!).size.width;
  }

  static double get fullHeight {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double get titleWidth {
    if (MediaQuery.of(Get.context!).size.width > 640) {
      return 360;
    }
    return 300;
  }

  static double get adaptedWidth {
    if (MediaQuery.of(Get.context!).size.width < 640) {
      return MediaQuery.of(Get.context!).size.width;
    } else if (MediaQuery.of(Get.context!).size.width < 1008) {
      return max(640, MediaQuery.of(Get.context!).size.width * 5 / 6);
    }
    return 720;
  }

  static double get adaptedHeight {
    return MediaQuery.of(Get.context!).size.height * 3 / 4;
  }

  static bool get isSmallScreen {
    return (MediaQuery.of(Get.context!).size.width < 640);
  }

  static bool get isMediumScreen {
    return (MediaQuery.of(Get.context!).size.width > 640) &&
        (MediaQuery.of(Get.context!).size.width < 1008);
  }

  static bool get isLargeScreen {
    return (MediaQuery.of(Get.context!).size.width > 1007);
  }

  static bool get isHugeScreen {
    return (MediaQuery.of(Get.context!).size.width > 1600);
  }
}

extension SignedString on int {
  String toSignedString() {
    return '${this >= 0 ? '+' : '-'}${abs()}';
  }
}
