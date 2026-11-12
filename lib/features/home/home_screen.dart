import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:school/utils/route_utils.dart";
import "package:school/features/schools/model/school.dart";
import "package:school/features/schools/school_detail.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoledKey = GlobalKey<ScaffoldState>();

  final List<School> _school = [
  School(
    name: "SILVANEI MARTINS",
    description: "Virando a noite atrás da grana!",
  ),
  School(
    name: "DINHEIRO DA MEIA-NOITE",
    description: "Noites de trabalho, ganhos maiores!",
  ),
  School(
    name: "DESENVOLVIMENTO E COMMITS",
    description: "Publicando código, colhendo lucros!",
  ),
  School(
    name: "EQUIPE SEM DORMIR",
    description: "O corre noturno nunca falha!",
  ),
  School(
    name: "CAÇADORES DE BOLSAS",
    description: "O sono é temporário, o fluxo de caixa é para sempre!",
  ),
  School(
    name: "CÓDIGO E CAFÉ",
    description: "Transformando cafeína em saldo positivo!",
  ),
  School(
    name: "MADRUGADA LUCRATIVA",
    description: "Enquanto o mundo dorme, a conta cresce!",
  ),
  School(
    name: "FÁBRICA DE DEPLOY",
    description: "Subindo sistemas e faturando alto!",
  ),
  School(
    name: "CLUBE DA INSÔNIA",
    description: "Cada hora acordado vale ouro no bolso!",
  ),
  School(
    name: "IMPÉRIO DO CÓDIGO",
    description: "Construindo riqueza linha por linha!",
  ),
  School(
    name: "ESQUADRÃO DO LUCRO",
    description: "Foco total na meta e zero descanso!",
  ),
  School(
    name: "TURNO DA RIQUEZA",
    description: "O verdadeiro expediente começa depois das dez!",
  ),
  School(
    name: "MESTRES DO FREELA",
    description: "Entregando projetos e multiplicando ganhos!",
  ),
  School(
    name: "OPERAÇÃO CAIXA ALTA",
    description: "Virando a chave do sucesso na madrugada!",
  ),
  School(
    name: "MENTES MILIONÁRIAS",
    description: "Ideias noturnas que geram resultados reais!",
  ),
];

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
              children: List.generate(_school.length, (index) {
                final School school = _school[index];
                
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (route) => SchoolDetail(school: school))
                    );
                  },
                  
                  // Icone do usuário!
                  leading: Hero(
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
                  // TRAZER INFO DO BACKEND!
                  title: Text(
                    school.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    school.description,
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
