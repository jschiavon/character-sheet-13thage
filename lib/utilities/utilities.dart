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
