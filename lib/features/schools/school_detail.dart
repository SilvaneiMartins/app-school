import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:school/core/app_assets.dart" show AppAssets;

import "package:school/features/home/home_screen.dart";
import "package:school/features/schools/model/school.dart";
import "package:school/features/schools/screens/school_home_screen.dart";
import "package:school/features/schools/screens/school_message_screen.dart";

class SchoolDetail extends StatefulWidget {
  final School school;

  const SchoolDetail({super.key, required this.school});

  @override
  State<SchoolDetail> createState() => _SchoolDetailState();
}

class _SchoolDetailState extends State<SchoolDetail> {

  final PageController _pageController = PageController();

  int _currentPageIndex = 0;

  final List<Widget> _screens = [
    SchoolHomeScreen(),
    SchoolMessageScreen(),
  ];
  
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

      body:  Column(
        children: [
          Row(
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
                         _currentPageIndex == 0 ? AppAssets.homeActiveIcon :  AppAssets.homeIcon
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
                       _currentPageIndex == 1 ? AppAssets.messageActiveIcon : AppAssets.messageIcon
                      )
                    ),
                  ],
                ),
              )
            ],
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
          )
        ],
      ),
      
      // CORPO DA SCREEM!
      // Column(
      //   children: [
      //     Expanded(
      //       child: SingleChildScrollView(
      //         child: Column(
      //           children: List.generate(33, (index) {
      //             return Container(
      //               margin: const .all(16.0),
      //               height: 24.0,
      //               width: double.infinity,
      //               decoration: BoxDecoration(
      //                 color: Colors.grey,
      //                 borderRadius: BorderRadius.circular(12.0),
      //               ),
      //             );
      //           }),
      //         ),
      //       ),
      //     ),

      //     Padding(
      //       padding: const .only(left: 16.0, right: 16.0, bottom: 24.0),
      //       child: Form(
      //         child: TextFormField(
      //           decoration: InputDecoration(
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(24.0),
      //               borderSide: BorderSide(
      //                 color: Colors.grey,
      //               ),
      //             )
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
