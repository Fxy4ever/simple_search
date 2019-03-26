import 'package:flutter/material.dart';
import 'package:simple_search/page/ShowDataPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: new Text("简单查询"),
        ),
        body: SearchWidget(),
      ),//home这里为界面
    );
  }
}

class SearchWidget extends StatefulWidget{
  @override
  SearchWidgetStatus createState()=>new SearchWidgetStatus();
}

class SearchWidgetStatus extends State<SearchWidget>{
  TextEditingController _stuNumController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 24.0),
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 40,bottom: 40),
                child: TextFormField(
                  autofocus: false,
                  controller: _stuNumController,
                  decoration: InputDecoration(
                      labelText: "查询",
                      hintText: "请输入学号或姓名",
                      icon: Icon(Icons.supervised_user_circle)
                  ),
                  validator: (v){
                    return v
                        .trim()
                        .length > 0 ? null : "输入不能为空";
                  },
                ),
            ),
            new Expanded(
              child: Text("本软件仅作为日常查询使用 其他用途与作者无关"),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      padding: EdgeInsets.all(15.0),
                      child: Text("查询一下"),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: (){
                        String str = _stuNumController.text;
                        if(str.length > 0){
                          Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) => new ShowDataPage(searchInfo: str))
                          );
                        }else{
                          final inputEmpty = new SnackBar(content: new Text("输入不能为空"));
                          Scaffold.of(context).showSnackBar(inputEmpty);
                        }
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

