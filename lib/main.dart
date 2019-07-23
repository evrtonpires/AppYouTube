import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtub/screens/home.dart';

import 'blocs/videos_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((i) => VideosBloc())],
      child: MaterialApp(
        title: "Youtub",
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),

    );
  }
}