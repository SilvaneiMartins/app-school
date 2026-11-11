# School

Aplicativo Flutter em estágio inicial de desenvolvimento. A base atual inclui uma tela de abertura, navegação animada para a tela principal e temas claro e escuro.

## Estado atual

- **Tela de abertura:** exibe a mensagem `Ola Pessoal!` e aguarda dois segundos antes de iniciar a navegação.
- **Tela principal:** possui uma barra superior com avatar e um menu lateral à direita, ainda sem conteúdo.
- **Navegação:** substitui a tela de abertura pela principal com uma transição vertical, implementada em `RouteUtils`.
- **Aparência:** temas claro e escuro definidos em `AppTheme`, seguindo a preferência do sistema.

Ainda não há funcionalidades de gestão escolar, autenticação, persistência de dados ou integração com serviços externos implementadas.

## Tecnologias

| Tecnologia | Uso no projeto |
| --- | --- |
| Flutter e Dart | Interface e lógica do aplicativo |
| Material Design | Componentes visuais |
| `flutter_riverpod` | Dependência declarada para gerenciamento de estado; ainda sem providers implementados |
| `cupertino_icons` | Pacote de ícones disponível como dependência |
| `flutter_test` | Infraestrutura de testes de widgets |
| `flutter_lints` | Regras de análise estática |

## Pré-requisitos

- Flutter SDK com Dart compatível com a restrição `^3.13.7` do `pubspec.yaml` (Dart a partir de 3.13.7 e anterior a 4.0.0).
- Ambiente de desenvolvimento configurado para a plataforma desejada.
- Um dispositivo, emulador ou navegador disponível para executar o aplicativo.

O projeto contém diretórios de plataforma para Android, iOS, web, Windows, macOS e Linux. A presença desses diretórios não representa validação do aplicativo em todas as plataformas.

## Como executar

Na pasta raiz do projeto, verifique o ambiente e instale as dependências:

```sh
flutter doctor
flutter pub get
```

Liste os dispositivos disponíveis e execute o aplicativo:

```sh
flutter devices
flutter run
```

Para escolher um destino específico, use o identificador exibido por `flutter devices`:

```sh
flutter run -d <id-do-dispositivo>
```

Não é necessário configurar variáveis de ambiente, credenciais ou um backend para a implementação atual.

## Estrutura do projeto

```text
lib/
├── main.dart                  # Inicialização e configuração do MaterialApp
├── core/
│   └── app_theme.dart         # Temas claro e escuro
├── splash/
│   └── splash_screen.dart     # Tela de abertura e redirecionamento
├── home/
│   └── home_screen.dart       # Estrutura da tela principal
└── utils/
    └── route_utils.dart      # Transições animadas entre telas
test/
└── widget_test.dart           # Teste padrão de contador, pendente de atualização
pubspec.yaml                  # Dependências, versão e restrição do SDK
analysis_options.yaml         # Configuração da análise estática
```

## Análise e testes

Para executar a análise estática:

```sh
flutter analyze
```

Para executar os testes:

```sh
flutter test
```

**Pendência conhecida:** `test/widget_test.dart` ainda contém o teste de contador do template Flutter. Ele procura os textos `0` e `1` e um botão de adição, que não existem na interface atual. Esse teste precisa ser atualizado para validar o fluxo de abertura e a tela principal; a suíte atual não deve ser considerada uma validação desse fluxo.

## Versão

A versão declarada em `pubspec.yaml` é `1.0.0+1`. O pacote está configurado com `publish_to: 'none'`, desabilitando a publicação no pub.dev.

---

## 👤 Autor

Desenvolvido por **Silvanei Martins**

- 💼 [LinkedIn](https://www.linkedin.com/in/silvanei-martins-a5412436)
- 🌐 [Site Pessoal](https://silvaneimartins.com.br/)
- 🐱 [GitHub](https://github.com/Store-Sam-Martins)
- 📧 silvaneimartins_rcc@hotmail.com
- 🎥 [YouTube](https://www.youtube.com/@silvaneimartins2487/featured)
- 🐦 [X (Twitter)](https://x.com/SilvaneiMartins)

<a href="https://github.com/SilvaneiMartins">
    <img
        style="border-radius:50%"
        src="https://github.com/SilvaneiMartins.png"
        width="100px;"
        alt="Silvanei Martins"
    />
    <br />
    <sub>
        <b>Silvanei de Almeida Martins</b>
    </sub>
</a>
     <a href="https://github.com/SilvaneiMartins" title="Silvanei martins" >
 </a>
<br />
🚀 Feito com ❤️ por Silvanei Martins
