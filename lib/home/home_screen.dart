import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoledKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoledKey,
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Padding(
          padding: const .symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: CircleAvatar()),
              IconButton(
                onPressed: () {
                  if (_scaffoledKey.currentState!.isDrawerOpen) {
                    _scaffoledKey.currentState?.closeDrawer();
                  } else {
                    _scaffoledKey.currentState?.openDrawer();
                  }
                },
                icon: Icon(Icons.menu),
              ),
            ],
          ),
        ),
      ),
      drawer: const Drawer(
        // TODO: Items do drawer vai aqui!
      ),
      body: SingleChildScrollView(
        padding: const .symmetric(horizontal: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pesquisar na aplicação!
            Padding(
              padding: const .symmetric(horizontal: 8.0),
              child:  SearchBar(
                elevation: WidgetStatePropertyAll(0),
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                hintText: "Procurar na escola...",
              ),
            ), 

            const SizedBox(height: 8.0),

            // Lista da escola!
            Column(
              children: List.generate(13, (index) {
                return ListTile(
                  onTap: () {
                    // TODO: FUNÇÃO AQUI...
                  },
                  leading: SizedBox(
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
                  // TRAZER INFO DO BACKEND!
                  title: Text(
                    "SILVANEI MARTINS 🇧🇷 🔒 💵",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    "Virando a noite atrás da grana!",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                );
              }),
            ),

            // Deixe um espaço na parte inferior!
            const SizedBox(height: 120.0),
          ],
        ),
      ),
    );
  }
}
