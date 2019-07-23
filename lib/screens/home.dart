import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtub/blocs/videos_bloc.dart';
import 'package:youtub/delegates/data_search.dart';
import 'package:youtub/widgets/video_tile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25,
          child: Image.asset("logos/logoyt.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.black,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              "0",
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.star,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () async {
                String result =
                await showSearch(context: context, delegate: DataSearch());
                if (result != null) {
                  BlocProvider
                      .getBloc<VideosBloc>()
                      .inSearch
                      .add(result);
                }
              }),
        ],
      ),
        backgroundColor: Colors.black,
        body: Container(
          child: StreamBuilder(
              stream: BlocProvider
                  .getBloc<VideosBloc>()
                  .outVideos,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return VideoTile(snapshot.data[index]);
                    },
                    itemCount: snapshot.data.length,
                  );
                } else {
                  return Container();
                }
              }),
        )
    );
  }
}
