## Flutter simple guide
                                     
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
2. - Main method are start point `main()`.
3. - Run runApp()  whith the widget Center.
5. - Text widget.
6. - left to right

- Structure of simple apps 

<img width="200" alt="structure" src="figs/structure.png">

### Run tests

- Open `dart_tests` folder

```shell
    flutter test test/counter_test.dart
```
- 
```shell
    flutter test test/mokito-test_test.dart 
  ```

If no file are provided, all test will be run.

### Web serve commands

- flutter packages pub global activate webdev
- flutter packages pub global run webdev serve

### BLOC
> The goal of this library is to make it easy to separate presentation from business logic, facilitating testability and reusability.

- Bloc logical

<img width="400" alt="structure" src="figs/bloc_architecture.png">

- Dependencies 
```yaml
dependencies:
  bloc: ^6.0.0
  flutter_bloc: ^6.0.0
```

- Import 
```dart 
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
```

#### Bloc: Simple, powerful and testable
- know what state our application is in at any point in time
- Record every single user interaction in our application so that we can make data-driven decisions.
- Work as efficiently as possible and reuse components both within our application and across other applications
- have many developers seamlessly working within a single code base following the same patterns and conventions.

#### Architecture

<img width="400" alt="structure" src="figs/bloc_architecture_full.png">

#### Layers
Using the bloc library allows us to separate our application into three layers:

- Presentation:  The presentation layer's responsibility is to figure out how to render itself based on one or more bloc states. In addition, it should handle user input and application lifecycle events. In addition, the presentation layer will have to figure out what to render on the screen based on the state from the bloc layer.

- Business Logic : The business logic layer's responsibility is to respond to input from the presentation layer with new states. This layer can depend on one or more repositories to retrieve data needed to build up the application state.

- Data: The data layer's responsibility is to retrieve/manipulate data from one or more sources. This layer is the lowest level of the application and interacts with databases, network requests, and other asynchronous data sources.

  - Repository : As you can see, our repository layer can interact with multiple data providers and perform transformations on the data before handing the result to the business logic Laye
  - Data Provider : The data provider will usually expose simple APIs to perform CRUD operations. We might have a createData, readData, updateData, and deleteData method as part of our data layer

### MVVW

- MVVW complements BLOC layers because separate UI logic, Presentation Logic and Business Logic.

-  <img width="500" alt="structure" src="figs/MVVMOverview.png">  
- <img width="500" alt="structure" src="figs/mvvw.png"> |


### Patterns [4,5]

#### References

- [1] https://bloclibrary.dev/#/
- [2] https://github.com/passsy/dart-lint
- [3] https://github.com/passsy/flutter-by-example
- [4] https://github.com/Flutterando/padroes_de_projeto/blob/master/versionamento.md
- [5] https://github.com/Flutterando/padroes_de_projeto/blob/master/nomenclatura.md
- [6] https://flutter.github.io/samples/#
- [7] https://bloclibrary.dev/#/fluttertodostutorial
- [8] https://fluttersamples.com
- [9] https://www.devmedia.com.br/entendendo-o-pattern-model-view-viewmodel-mvvm/18411
