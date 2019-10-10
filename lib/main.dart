import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '小宝工具箱 ',
      theme: ThemeData(
        primarySwatch: Colors.grey[150],
      ),
      home: MyHomePage(title: '小宝游戏箱-俄罗斯方块'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        //Flex的两个子widget按1：3来占据水平空间
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: MediaQuery.of(context).size.height - 181,
                color: Colors.grey[300],
                child: Column(
                  children: <Widget>[
                    new Padding(padding: new EdgeInsets.only(top: 50)),
                    new Text('总分', style: TextStyle(fontSize: 18)),
                    new Padding(padding: new EdgeInsets.only(top: 5)),
                    new Text('0',
                        style: TextStyle(fontSize: 36, color: Colors.red)),
                    new Padding(padding: new EdgeInsets.only(top: 15)),
                    new Text('下一方块', style: TextStyle(fontSize: 16)),
                    new Padding(padding: new EdgeInsets.only(top: 15)),

                    new Container(
                      height: 100,
                      child: GridView.count(
                          crossAxisCount: 4,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                          padding: EdgeInsets.all(2.0),
                          children: <Widget>[
                            Container(
                            ),
                            Container(
                              color: Colors.yellow,
                            ),
                            Container(
                            ),
                            Container(
                            ),
                            Container(
                            ),
                            Container(
                              color: Colors.yellow,
                            ),
                            Container(
                            ),
                            Container(
                            ),
                            Container(
                            ),
                            Container(
                              color: Colors.yellow,
                            ),
                            Container(
                            ),
                            Container(
                            ),
                            Container(
                            ),
                            Container(
                              color: Colors.yellow,
                            ),
                            Container(
                            ),
                            Container(
                            ),
                          ]),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: MediaQuery.of(context).size.height - 181,
                color: Colors.grey[200],
                child: GridView.count(
                  crossAxisCount: 10,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  padding: EdgeInsets.all(2.0),
                  children: <Widget>[
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.red,
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.red,
                    ),
                    Container(
                      color: Colors.red,
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.red,
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    ),
                    Container(
                      color: Colors.grey[100],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 181.0,
          //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey[100],
                  )),
              Expanded(
                flex: 4,
                child: Container(
                    padding: EdgeInsets.only(top: 10),
                    color: Colors.grey[100],
                    alignment: Alignment.center,
                    child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        padding: EdgeInsets.all(2.0),
                        children: <Widget>[
                          Container(),
                          Container(),
                          Container(),
                          Container(
                            child: RaisedButton(
                                child: Text("左"),
                                color: Colors.blue,
                                textColor: Colors.white,
                                splashColor: Colors.white,
                                shape: CircleBorder(),
                                onPressed: () {
                                  print("左");
                                }),
                          ),
                          Container(),
                          Container(
                            child: RaisedButton(
                                child: Text("右"),
                                color: Colors.blue,
                                textColor: Colors.white,
                                splashColor: Colors.white,
                                shape: CircleBorder(),
                                onPressed: () {
                                  print("右");
                                }),
                          ),
                          Container(),
                          Container(),
                          Container()
                        ])),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.grey[100],
                  alignment: Alignment.center,
                  child: RaisedButton(
                      child: new Padding(
                        padding: new EdgeInsets.all(30),
                        child: new Text("变形"),
                      ),
                      elevation: 20,
                      color: Colors.blue,
                      textColor: Colors.white,
                      splashColor: Colors.white,
                      shape: CircleBorder(),
                      onPressed: () {
                        print("变形");
                      }),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
