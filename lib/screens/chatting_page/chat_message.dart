import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/models/ChattingModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final ChattingModel chattingModel;
  final String txt;
  final String id;
  final String image;
  final Animation<double> animation;

  const ChatMessage(this.txt, this.id,  {
    this.image='', @required this.animation,@required this.chattingModel, Key key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isMe=true;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
      child: FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          axisAlignment: 1,
          child: Stack(
            //fit: StackFit.passthrough,
            overflow: Overflow.visible,
            alignment: isMe? Alignment.topRight:Alignment.topLeft,
            /*mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,*/
            children: [
            Padding(
              padding: isMe? EdgeInsets.fromLTRB(0, 0, 30, 0):EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Column(
                crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                Padding(
                  padding:EdgeInsets.symmetric(horizontal: 15),
                  child: Text(id, style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                image==''? Container():
                            Padding(
                              padding: isMe? EdgeInsets.fromLTRB(120, 0, 0, 0):EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Image(image: new CachedNetworkImageProvider(image), width:250, height:200,fit: BoxFit.fill),
                            ),
                Container(
                    //margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    decoration: BoxDecoration(
                        color: isMe?Colors.amber[400]:Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(isMe? 10:0),
                            topRight: Radius.circular(isMe? 0:10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                        )),
                    child: Text(txt)
                ),
              ],),
            ),
              CircleAvatar(
                backgroundColor: Colors.amberAccent,
                child:  Text("N"),),
          ],
          ),
        ),
      ),
    );
  }
}
