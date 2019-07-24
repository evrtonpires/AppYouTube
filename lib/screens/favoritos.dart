import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtub/blocs/favoritos_bloc.dart';
import 'package:youtub/models/video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:youtub/api.dart';

class Favoritos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<FavoritosBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: StreamBuilder<Map<String, Video>>(
          stream: bloc.outFav,
          initialData: {},
          builder: (context, snapshot) {
            return ListView(
              children: snapshot.data.values.map((v) {
                return InkWell(
                  onTap: () {
                    FlutterYoutube.playYoutubeVideoById(
                        apiKey: API_KEY, videoId: v.id);
                  },
                  onLongPress: () {
                    bloc.toggleFavorito(v);
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 50,
                        child: Image.network(v.thumb),
                      ),
                      Expanded(
                          child: Text(
                        v.title,
                        style: TextStyle(color: Colors.white70),
                        maxLines: 2,
                      ))
                    ],
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
