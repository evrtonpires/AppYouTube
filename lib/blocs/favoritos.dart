import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:youtub/models/video.dart';
import 'dart:async';

class FavoritosBloc implements BlocBase {
  Map<String, Video> _favoritos = {};

  final StreamController<Map<String, Video>> _favController =
      StreamController<Map<String, Video>>.broadcast();

  Stream<Map<String, Video>> get outFav => _favController.stream;

  void toggleFavorito(Video video) {
    if (_favoritos.containsKey(video.id)) {
      _favoritos.remove(video.id);
    } else {
      _favoritos[video.id] = video;
    }
    _favController.sink.add(_favoritos);
  }

  @override
  void addListener(listener) {
    _favController.close();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => null;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }
}
