import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:youtub/models/video.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

class FavoritosBloc implements BlocBase {
  Map<String, Video> _favoritos = {};

  final _favController = BehaviorSubject<Map<String, Video>>.seeded({});

  Stream<Map<String, Video>> get outFav => _favController.stream;

  FavoritosBloc() {
    SharedPreferences.getInstance().then((prefs) {
      if (prefs.getKeys().contains("favorites")) {
        _favoritos = json.decode(prefs.getString("favorites")).map(
                (k, v) {
              return MapEntry(k, Video.fromJson(v));
            }
        ).cast<String, Video>();

        _favController.add(_favoritos);
      }
    });
  }

  void toggleFavorito(Video video) {
    if (_favoritos.containsKey(video.id)) {
      _favoritos.remove(video.id);
    } else {
      _favoritos[video.id] = video;
    }
    _favController.sink.add(_favoritos);

    _salvarFav();
  }

  void _salvarFav() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("favorites", json.encode(_favoritos));
    });
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
