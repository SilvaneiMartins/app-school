import "package:flutter/cupertino.dart";

class RouteUtils {
  static PageRouteBuilder animateToRoute({
    required Widget destination,
    Offset? offset,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ).drive(Tween(begin: offset ?? Offset(0, 1), end: .zero)),
          child: destination,
        );
      },
    );
  }
}
