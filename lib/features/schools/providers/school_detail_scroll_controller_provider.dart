import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/legacy.dart";

final schoolDeatailScrollControllerProvider = StateProvider<ScrollController>(
  (ref) => ScrollController(),
);
