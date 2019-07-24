import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:youtub/blocs/favoritos_bloc.dart';
import 'package:youtub/models/video.dart';

class VideoTile extends StatelessWidget {
  final Video video;

  VideoTile(this.video);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Image.network(
              video.thumb,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Text(
                          video.title,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Text(
                          video.channel,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      )
                    ],
                  )),
              StreamBuilder<Map<String, Video>>(
                  stream: BlocProvider
                      .getBloc<FavoritosBloc>()
                      .outFav,

                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return IconButton(
                          icon: Icon(
                            snapshot.data.containsKey(video.id) ?
                            Icons.star : Icons.star_border,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            BlocProvider.getBloc<FavoritosBloc>()
                                .toggleFavorito(video);
                          });
                    }
                    else {
                      return Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        child: FlareActor(
                          "logos/carregando.flr", animation: "carregando",
                          color: Colors.red,
                        ),
                      );
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
