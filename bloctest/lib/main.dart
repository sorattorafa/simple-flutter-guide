import 'package:flutter/material.dart';
import 'package:bloctest/model.dart';
import 'package:bloctest/repository.dart';
void main() => runApp(BlocApp());

class BlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter para Iniciantes - BLoC',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Repository bloc = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter para Iniciantes - BLoC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
                stream: bloc.minhaStream,
                initialData: 0,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Há um erro na Stream');
                  } else {
                    return Text(
                      '${snapshot.data}',
                      style: Theme.of(context).textTheme.bodyText1,
                    );
                  }
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bloc.incrementar,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
  @override
  void dispose() {
    bloc.fecharStream();
    super.dispose();
  }
}
