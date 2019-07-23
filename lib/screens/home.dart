import 'package:flutter/material.dart';
import 'package:youtub/delegates/data_search.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25,
          child: Image.asset("logos/logoyt.png"),),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text("10",textAlign: TextAlign.end
              ,style: TextStyle(color: Colors.black),),
          ),
          IconButton(
              icon: Icon(Icons.star,color: Colors.black,),
              onPressed: (){}),
          IconButton(
              icon: Icon(Icons.search,color: Colors.black,),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              }),
        ],
      ),
      body: Container(),
    );
  }
}
