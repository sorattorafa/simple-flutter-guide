### Flutter simple guide
> Author: Rafael Soratto
                                     
### Installation (linux and mac)
- https://flutter.dev/docs/get-started/install/linux
- https://flutter.dev/docs/get-started/install/macos


After flutter installation, setup:
-  The flutter tool downloads platform-specific development binaries as needed: 
    - `flutter precache`
- Run the following command to see if there are any dependencies you need to install to complete the setup (for verbose output, add the -v flag): 
    - `flutter doctor`

### Chrome setup
You can test app's into  devices, emulators, or chrome browser. 
This guide using the web way, as follow https://flutter.dev/docs/get-started/web

- To create a new project with web support, run the following commands to use the latest version of the Flutter SDK from the beta channel and enable web support:
    - `flutter channel beta` or `flutter channel master`
    - `flutter upgrade`
    - `flutter config --enable-web`
    - `flutter devices`
    - Run `flutter devices` and Chrome device is enable and visible.
- Add web support to an existing app: To add web support to an existing project, run the following command in a terminal from the root project directory:
    - `flutter create .` 


### Create simple example
- `flutter create myapp` 
- `cd myapp`
- `flutter pub get` (install dependencies)
- `flutter run -d chrome`
When run app, the file containing main func is `hello_world\lib\main.dart`, and it contents:
```dart
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    Center(
      child: Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
```
1. - Import widgets  packages
2. - O método `main()` é o ponto de partida de qualquer aplicativo.
3. - Executando runApp(), o Flutter constroi o widget informado como parâmetro. Neste caso, um widget do tipo Center
4. - Declaramos que Center possui um filho do tipo Text. Aplica-se aqui o conceito de composição. Textnão é do tipo Center. Ele compõe o widget Center. Text não herda nenhuma característica de Center.
5. - Declaramos o widget do tipo Text. Precisamos informar uma string, que será o texto exibido.
6. - Estamos informando que a direção do texto é left to right (esquerda para direita

- Structure of simple apps 

<img width="200" alt="structure" src="structure.png">

### Run 
- 
```shell
    flutter test test/counter_test.dart
```
- 
```shell
    flutter test test/mokito-test_test.dart 
  ```

If no file are provided, all test will be run.

### Web serve

- flutter packages pub global activate webdev
- flutter packages pub global run webdev serve

### BLOC


#### References
- https://fluttersamples.com
- https://github.com/brianegan/bloc
- https://github.com/passsy/dart-lint
- https://github.com/passsy/flutter-by-example
- https://github.com/Flutterando/padroes_de_projeto/blob/master/versionamento.md
- https://github.com/Flutterando/padroes_de_projeto/blob/master/nomenclatura.md
- https://flutter.github.io/samples/#
- https://bloclibrary.dev/#/fluttertodostutorial