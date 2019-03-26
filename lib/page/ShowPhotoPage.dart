import 'package:flutter/material.dart';
import 'package:simple_search/config/Api.dart';

class ShowPhotoPage extends StatelessWidget{
  final String stuNum;

  ShowPhotoPage({this.stuNum});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("照片查看"),
      ),
      body: ShowPhotoWidget(stuNum: stuNum),
    );
  }
}

class ShowPhotoWidget extends StatefulWidget{
  final String stuNum;

  ShowPhotoWidget({this.stuNum});

  @override
  State<StatefulWidget> createState() => ShowPhotoState(stuNum: stuNum);
}

class ShowPhotoState extends State<ShowPhotoWidget>{
  String stuNum;

  ShowPhotoState({this.stuNum});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      child: Image.network(PHOTO+"/$stuNum.jpg",fit: BoxFit.fitWidth),
      constraints: new BoxConstraints.expand(),
    );
  }
}