import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class SchoolHomeScreen extends StatefulWidget {
  const SchoolHomeScreen({super.key});

  @override
  State<SchoolHomeScreen> createState() => _SchoolHomeScreenState();
}

class _SchoolHomeScreenState extends State<SchoolHomeScreen> {
  bool _showInputField = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 0,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    width: double.infinity,
                    margin: const .only(bottom: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red,
                    ),
                  );
                },
              ),
            ),

            if (_showInputField) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // BOTÃO FECHAR
                  Padding(
                     padding: const EdgeInsets.only(bottom: 4.0),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _showInputField = false;
                        });
                      },
                      style: IconButton.styleFrom(
                        iconSize: 16,
                        minimumSize: const Size(28, 28),
                        fixedSize: const Size(28, 28),
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        side: BorderSide(
                          color: Color(0xEEB3B3B3),
                        )
                      ),
                      icon: Icon(Icons.close),
                    ),
                  ),
                  
                  Container(
                    width: double.infinity,
                    margin: const .only(bottom: 24.0),
                    padding: const .all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: .circular(16.0),
                      border: Border.all(color: Color(0xEED9D9D9)),
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
                              border: UnderlineInputBorder(borderSide: .none),
                            ),
                          ),

                          const SizedBox(height: 2.0),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    icon: Icon(Icons.mic, color: Colors.black),
                                  ),
                                ],
                              ),

                              IconButton(
                                onPressed: () {
                                  // TODO: ENVIAR MENSAGEM!
                                },
                                style: IconButton.styleFrom(
                                  backgroundColor: Color(0xEED9D9D9),
                                  side: BorderSide(color: Color(0xEEB3B3B3)),
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
            ] else ...[
              SizedBox.shrink(),
            ],
          ],
        ),
      ),

      // BOTÃO FLUTUANTE!
      floatingActionButton: !_showInputField
          ? ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _showInputField = !_showInputField;
                });
              },
              label: Text("Criar"),
            )
          : SizedBox.shrink(),
    );
  }
}
