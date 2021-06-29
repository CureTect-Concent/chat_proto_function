import 'package:chat_app/models/ChattingModel.dart';
import 'package:chat_app/screens/chatting_page/local_utils/Chatting_Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChattingItem extends StatelessWidget {
  final ChattingModel chattingModel;

  const ChattingItem({Key key, @required this.chattingModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<ChattingProvier>(context);
    var isMe = chattingModel.pk == p.pk;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Text(chattingModel.name, style: TextStyle(fontSize: 17),),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                decoration: BoxDecoration(
                    color: isMe?Colors.amber[400]:Colors.grey[700],
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(isMe? 10:0),
                    topRight: Radius.circular(isMe? 0:10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                )),
                child: Text(
                  chattingModel.text, style: TextStyle(color: Colors.white, fontSize: 18),),
              )
            ],
          )
        ],
      ),
    );
  }
}
