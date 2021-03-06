//Technical Page
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Bussiness extends StatefulWidget {
  @override
  _BussinessState createState() => _BussinessState();
}

class _BussinessState extends State<Bussiness> {
  @override
  Widget build(BuildContext context) {
    List data;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Technical Questions"),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Stack(
          fit:StackFit.expand,
          children: <Widget>[
            new Image(
              image: new AssetImage("assets/pictech.jpg"),
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.saturation,
              color: Colors.white24,
            ),
            new Container(
              child: new Center(
                  child: new FutureBuilder(
                    future: DefaultAssetBundle.of(context).loadString('load_json/technical.json'),
                    builder: (context, snapshot){
                      var mydata = jsonDecode(snapshot.data.toString());
                      return new ListView.builder(
                        itemBuilder: (BuildContext context, int index){
                          index = index+1;
                          return new Card(
                            color: Colors.black45,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                            ),
                            child: new InkWell(
                              splashColor: Colors.black54,
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                  new Scaffold(
                                      appBar: new AppBar(
                                        title: new Text("Question"),
                                        backgroundColor: Colors.lightBlueAccent,
                                      ),
                                      body: Stack(
                                        fit: StackFit.expand,
                                        children :<Widget>[
                                          new Image(
                                            image: new AssetImage("assets/pictech.jpg"),
                                            fit: BoxFit.cover,
                                            colorBlendMode: BlendMode.darken,
                                            color: Colors.black45,
                                          ),
                                          new Container(
                                            padding: new EdgeInsets.only(top:10.0,left: 10.0,right: 10.0),
                                            child: ListView(
                                              //crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: <Widget>[
                                                new Text("Ques $index. "+mydata[index-1]['question'],
                                                  style: TextStyle(fontWeight: FontWeight.bold,
                                                      fontSize: 24.0,
                                                      color: Colors.white
                                                  ),
                                                ),
                                                new Padding(padding: EdgeInsets.only(top:5.0)),
                                                new Text("Answer:\n"+mydata[index-1]['answer'],
                                                  style: TextStyle(fontSize: 20.0,
                                                      color: Colors.white
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                )
                                );
                              },
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  new Padding(padding: EdgeInsets.only(top:3.0)),
                                  new Text("Ques $index. "+mydata[index-1]['question'],
                                    style: TextStyle(fontSize: 20.0,
                                        fontWeight: FontWeight.w500,color: Colors.white
                                    ),
                                  ),
                                  new Text("Company: "+mydata[index-1]['company'],
                                  style: TextStyle(fontSize: 16.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white
                                  ),
                                  ),
                                  new Padding(padding: EdgeInsets.only(bottom: 15)),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: mydata == null ? 0:mydata.length,
                      );
                    },
                  )
              ),
            ),
          ],
        )
    );
  }
}