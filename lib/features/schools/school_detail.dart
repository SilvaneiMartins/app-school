import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import 'package:flutter/rendering.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:school/core/app_assets.dart" show AppAssets;

import "package:school/features/home/home_screen.dart";
import "package:school/features/schools/model/school.dart";
import "package:school/features/schools/screens/school_home_screen.dart";
import "package:school/features/schools/screens/school_message_screen.dart";
import "package:school/features/schools/providers/school_detail_scroll_controller_provider.dart";

class SchoolDetail extends ConsumerStatefulWidget {
  final School school;

  const SchoolDetail({super.key, required this.school});

  @override
  ConsumerState<SchoolDetail> createState() => _SchoolDetailState();
}

class _SchoolDetailState extends ConsumerState<SchoolDetail>
    with TickerProviderStateMixin {
  late final AnimationController _navBarAnimationController;
  late final Tween<Offset> _tween;

  final PageController _pageController = PageController();
  late final ScrollController scrollController;

  int _currentPageIndex = 0;

  final List<Widget> _screens = [SchoolHomeScreen(), SchoolMessageScreen()];

  @override
  void initState() {
    super.initState();

    scrollController = ref.watch(schoolDeatailScrollControllerProvider);

    _navBarAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    )..forward();

    _tween = Tween(begin: Offset(0, -1), end: .zero);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(() async {
        if (scrollController.hasClients) {
          if (scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
            await _navBarAnimationController.reverse();
          } else {
            await _navBarAnimationController.forward();
          }

          setState(() {});
        }
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _navBarAnimationController.dispose();
    scrollController.dispose();
    scrollController.removeListener;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            BackButton(),

            Hero(
              tag: "school_detail",
              child: SizedBox(
                height: 40,
                width: 40,
                child: Stack(
                  children: [
                    Align(
                      alignment: .topCenter,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: CupertinoColors.activeGreen,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Align(
                      alignment: .centerRight,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: CupertinoColors.activeOrange,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Align(
                      alignment: .centerLeft,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: CupertinoColors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Align(
                      alignment: .bottomCenter,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemIndigo,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 12.0),

            Expanded(
              child: Text(
                widget.school.name,
                style: TextStyle(fontSize: 16.0),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        leadingWidth: double.infinity,
      ),

      body: Column(
        children: [
          SizeTransition(
            sizeFactor: CurvedAnimation(
              parent: _navBarAnimationController,
              curve: Curves.easeInOut,
            ),
            child: SlideTransition(
              position: CurvedAnimation(
                parent: _navBarAnimationController,
                curve: Curves.easeInOut,
              ).drive(_tween),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        0,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: Row(
                      children: [
                        ImageIcon(
                          AssetImage(
                            _currentPageIndex == 0
                                ? AppAssets.homeActiveIcon
                                : AppAssets.homeIcon,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        1,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: Row(
                      children: [
                        ImageIcon(
                          AssetImage(
                            _currentPageIndex == 1
                                ? AppAssets.messageActiveIcon
                                : AppAssets.messageIcon,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // MENSAGEM!
          Expanded(
            child: PageView(
              onPageChanged: (val) {
                setState(() {
                  _currentPageIndex = val;
                });
              },
              controller: _pageController,
              children: _screens,
            ),
          ),
        ],
      ),
    );
  }
}
