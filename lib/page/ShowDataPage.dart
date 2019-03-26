import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:simple_search/bean/StuBean.dart';
import 'package:simple_search/config/Api.dart';
import 'package:simple_search/util/HttpUtil.dart';
import 'ShowPhotoPage.dart';

class ShowDataPage extends StatelessWidget{
  final String searchInfo;
  ShowDataPage({this.searchInfo});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("查询结果"),
      ),
      body: ShowDataWidget(searchInfo:searchInfo),
    );
  }
}


class ShowDataWidget extends StatefulWidget{
  final String searchInfo;
  ShowDataWidget({this.searchInfo});

  @override
  State<StatefulWidget> createState() {
    return ShowDataState(searchInfo: searchInfo);
  }
}

class ShowDataState extends State<ShowDataWidget>{
  final String searchInfo;
  ShowDataState({this.searchInfo});
  StuBean _myData;
  bool isload = false;

  loadData(String data){
    String url = SEARCH;
    url+="?search="+data;
    Http.get(url).then((res){
      if(res != null){
        Map<String,dynamic> map = jsonDecode(res);
        print(res);
        StuBean stuBean = new StuBean.fromJson(map);
        setState(() {
          _myData = stuBean;
          isload = true;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    if(!isload){
      loadData(searchInfo);
    }
    if(isload){
      return ListView.separated(
        itemCount: _myData.results.length ,
        separatorBuilder: (BuildContext context, int index) => new Divider(),
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context,i){
          return _buildItem(i);
        },
      );
    }else{
      return Container(
        alignment: Alignment.center,
        child: Text("暂时没有该信息!"),
      );
    }
  }

  Widget _buildItem(int i){
    if(_myData.results[i]!=null){
      return new GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) =>
                        ShowPhotoPage(stuNum: _myData.results[i].stuNum,))
            );
          },
          child: _buildRow(_myData.results[i])
      );
    }
  }

  Widget _buildRow(Results results){
    return new Container(
      child: Column(
        children: <Widget>[
          Row(//第一行，姓名，学号，性别
            children: <Widget>[
              buildOneLine(results.name, Colors.black, 18.0),
              buildOneLine(results.stuNum, Colors.black54, 15.0),
              buildOneLine(results.sex, Colors.blue, 15.0)
            ],
          ),
          Row(
            children: <Widget>[//班级号，专业
              buildOneLine(results.classNum, Colors.black54, 15.0),
              buildOneLine(results.major, Colors.black54, 15.0),
            ],
          ),
          Row(
            children: <Widget>[//学院
              buildOneLine(results.academy, Colors.black54, 15.0),
            ],
          )
        ],
      ),
    );
  }

  Widget buildOneLine(String info,Color color,double size){
    return new Padding(
      padding: EdgeInsets.all(10.0),
      child: new Text(
        info,
        style: new TextStyle(
            fontSize: size,
            color: color
        ),
      ),
    );
  }


}