import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:school/features/schools/providers/school_detail_scroll_controller_provider.dart";

class SchoolHomeScreen extends ConsumerStatefulWidget {
  const SchoolHomeScreen({super.key});

  @override
  ConsumerState<SchoolHomeScreen> createState() => _SchoolHomeScreenState();
}

class _SchoolHomeScreenState extends ConsumerState<SchoolHomeScreen>
    with TickerProviderStateMixin {
  bool _showInputField = false;

  late final AnimationController _animationController;
  late final Tween<Offset> _tween;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
      reverseDuration: const Duration(milliseconds: 600),
    );

    _tween = Tween(begin: Offset(1, 0), end: .zero);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  // TEXT FEED! 
                  Container(
                    width: double.infinity,
                    padding: const .symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        // HEADER DA MENSAGEM!
                        ListTile(
                          contentPadding: .zero,
                          leading: CircleAvatar(),
                          title: Text.rich(
                            maxLines: 1,
                            overflow: .ellipsis,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Silvanei Martins ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                TextSpan(
                                  text: ' ○ ${23} min',
                                  style: TextStyle(
                                    color: const Color(0xEE808187),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Text(
                            "Software Developer | Boston University",
                            style: TextStyle(color: const Color(0xEE808187)),
                            maxLines: 1,
                            overflow: .ellipsis,
                          ),
                          trailing: IntrinsicWidth(
                            child: Align(
                                alignment: .topRight,
                                child: InkWell(
                                onTap: () {
                                  // TODO: CRIAR LÓGICA!
                                },
                                child: Icon(
                                  CupertinoIcons.ellipsis,
                                  color: const Color(0xEE4D4f57),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // BODY MENSAGEM!
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley"
                        ),

                        const SizedBox(height: 12.0),

                        // ICONES de COMPORTAMENTO!
                        Row(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // TODO:
                                  },
                                  child: Icon(
                                    Icons.favorite_border_rounded,
                                    size: 16.0,
                                  ),
                                ),
                            
                                const SizedBox(width: 8.0),
                                
                                Text("23.3 k")
                              ],
                            ),
                            
                             const SizedBox(width: 24.0),

                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // TODO:
                                  },
                                  child: Icon(
                                    Icons.message_outlined,
                                    size: 16.0,
                                  ),
                                ),
    
                                const SizedBox(width: 8.0),
                                
                                Text("433 k")
                              ],
                            )
                          ],
                        ),

                        
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: .bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_showInputField) ...[
                        SlideTransition(
                          position: CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.easeInOut,
                          ).drive(_tween),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // BOTÃO FECHAR
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: IconButton(
                                  onPressed: () async {
                                    if (_animationController.isCompleted) {
                                      await _animationController.reverse();
                                    }
              
                                    setState(() {
                                      _showInputField = false;
                                    });
                                  },
                                  style: IconButton.styleFrom(
                                    iconSize: 16,
                                    minimumSize: const Size(28, 28),
                                    fixedSize: const Size(28, 28),
                                    padding: EdgeInsets.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    side: BorderSide(color: Color(0xEEB3B3B3)),
                                    backgroundColor: Colors.white,
                                  ),
                                  icon: Icon(Icons.close),
                                ),
                              ),
              
                              Container(
                                width: double.infinity,
                                padding: const .all(16.0),
                                decoration: BoxDecoration(
                                  borderRadius: .circular(16.0),
                                  border: Border.all(color: Color(0xEED9D9D9)),
                                  color: Colors.white,
                                ),
                                child: Form(
                                  child: Column(
                                    children: [
                                      // INPUT ENVIA MENSAGEM!
                                      TextFormField(
                                        minLines: 1,
                                        maxLength: 8,
                                        onTapOutside: (_) =>
                                            FocusScope.of(context).unfocus(),
                                        decoration: InputDecoration(
                                          hintText: "Digite sua mensagem...",
                                          hintStyle: TextStyle(
                                            color: const Color(0xEEB3B3B3),
                                          ),
                                          border: UnderlineInputBorder(
                                            borderSide: .none,
                                          ),
                                        ),
                                      ),
              
                                      const SizedBox(height: 2.0),
              
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  // TODO: IR PARA GALERIA DE IMAGENS!
                                                },
                                                icon: Icon(
                                                  Icons.image_outlined,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  // TODO: GRAVAR AUDIO!
                                                },
                                                icon: Icon(
                                                  Icons.mic,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
              
                                          IconButton(
                                            onPressed: () {
                                              // TODO: ENVIAR MENSAGEM!
                                            },
                                            style: IconButton.styleFrom(
                                              side: BorderSide(
                                                color: Color(0xEEB3B3B3),
                                              ),
                                              backgroundColor: Color(0xEED9D9D9),
                                            ),
                                            icon: Icon(
                                              CupertinoIcons.arrow_up,
                                              color: Color(0xEEB3B3B3),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ] else ...[
                        Align(
                          alignment: .bottomRight,
                          child: Padding(
                            padding: const .only(bottom: 100.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  _showInputField = !_showInputField;
                                });
              
                                if (_showInputField) {
                                  _animationController.forward(from: 0);
                                }
                              },
                              label: Text("Criar"),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
