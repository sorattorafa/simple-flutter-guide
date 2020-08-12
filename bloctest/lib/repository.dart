import 'dart:async';
import 'model.dart';

class Repository {
  MeuBloc model = MeuBloc();
  
  // 1
  final _blocController = StreamController<int>();

  // 2
  Stream<int> get minhaStream => _blocController.stream;

  // 3 = new sink
  incrementar() {
    model.totalnum++;
    _blocController.sink.add(model.totalnum);
  }

  fecharStream() {
    _blocController.close();
  }
  
}