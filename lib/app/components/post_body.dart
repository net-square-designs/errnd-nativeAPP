import 'package:errnd/app/components/rate_stars.dart';
import 'package:flutter/material.dart';

class PostBody extends StatelessWidget {
  final String name;

  PostBody({this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(3, 15.0, 3.0, 3.0),
        child: new Container(
          decoration: new BoxDecoration(boxShadow: [
            new BoxShadow(
                color: Colors.grey,
                offset: new Offset(0, 0),
                blurRadius: 0.5,
                spreadRadius: 0.5)
          ], color: Colors.grey, borderRadius: new BorderRadius.circular(25.0)),
          height: 230,
          margin: EdgeInsets.only(top: 10),
          child: new Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(25.0)
                // new BorderRadius.circular(25.0),
                ),
            child: new Column(children: <Widget>[
              Container(
                  constraints: new BoxConstraints.expand(
                    height: 130.0,
                  ),
                  // alignment: Alignment.bottomRight,
                  padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    image: new DecorationImage(
                      image: new AssetImage('lib/app/assets/leee.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    child: new Stack(
                      children: <Widget>[
                        new Positioned(
                          bottom: 3,
                          child: new Material(
                              borderRadius: new BorderRadius.circular(25.0),
                              color: Colors.grey[600],
                              child: new Container(
                                margin: EdgeInsets.all(4),
                                child: new Text('TECHNOLOGY',
                                    style: new TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 11.0,
                                      color: Colors.white,
                                    )),
                              )),
                        ),
                        new Positioned(
                          top: 5,
                          child: new IconButton(
                            onPressed: () {},
                            iconSize: 28,
                            icon: new Icon(
                              // Icons.bookmark_border,
                              // color: Colors.white,

                              Icons.bookmark,
                              color: Colors.red[400],
                            ),
                          ),
                        ),
                        new Positioned(
                          right: 20,
                          top: 12,
                          child: new Image.asset(
                            'lib/app/assets/pp.png',
                            width: 40,
                            height: 40,
                          ),
                        ),
                        new Positioned(
                            bottom: 3,
                            right: 19,
                            child: new Rate(
                              starNo: 4,
                            )),
                      ],
                    ),
                  )
                  //  new Text('',
                  //     style: new TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 30.0,
                  //       color: Colors.red,
                  //     )),
                  ),
              // new Container(
              //     height: 130,
              //     decoration: new BoxDecoration(
              //         color: Colors.blue,
              //         borderRadius: new BorderRadius.only(
              //           topLeft: Radius.circular(25),
              //           topRight: Radius.circular(25),
              //         )
              //         // new BorderRadius.circular(25.0),
              //         ),
              //     child: new Stack(children: <Widget>[
              //       new Icon(
              //         Icons.linked_camera,
              //         color: Colors.red,
              //       ),
              //       new Image.asset(
              //         'lib/app/assets/pic2.png',
              //         fit: BoxFit.contain,
              //       ),
              //     ])),
              new Container(
                  height: 100,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  )),
                  child: new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Column(
                            children: <Widget>[
                              new Container(
                                  //color: Colors.greenAccent,
                                  height: 80,
                                  width: 207,
                                  padding: EdgeInsets.only(
                                    top: 7,
                                  ),
                                  // color: Colors.green,
                                  child: new Column(
                                    children: <Widget>[
                                      new Row(
                                        children: <Widget>[
                                          new Container(
                                              margin: EdgeInsets.only(left: 5),
                                              width: 200,
                                              child: new Text(
                                                "I can Make your watches at very affordable prices ASAP with discounts and lost of quality",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ))
                                        ],
                                      ),
                                      new Row(
                                        children: <Widget>[
                                          new Container(
                                              margin: EdgeInsets.only(
                                                  top: 5, left: 10),
                                              width: 190,
                                              child: new Text(
                                                "From N15,000",
                                                style: TextStyle(
                                                    color: Colors.blue[300],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                        ],
                                      )
                                    ],
                                  ))
                            ],
                          ),
                          new Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Row(
                                children: <Widget>[
                                  RaisedButton(
                                      highlightColor: Colors.grey[200],
                                      elevation: 1,
                                      textColor: Colors.white,
                                      color: Colors.white,
                                      child: new Row(children: <Widget>[
                                        new Icon(
                                          Icons.message,
                                          size: 18.0,
                                          color: Colors.deepPurple[700],
                                        ),
                                        Text(
                                          "  Chat",
                                          style: TextStyle(
                                              color: Colors.deepPurple[700],
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ]),
                                      onPressed: () {},
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(20.0))),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  new Container(
                                      margin: EdgeInsets.only(
                                        top: 19,
                                      ),
                                      child: new Text(
                                        "   View Details",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey[400],
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ))
            ]),
          ),
        ));
  }
}
