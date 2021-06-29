import 'dart:async';

import 'package:chat_app/models/ChattingModel.dart';
import 'package:chat_app/screens/chatting_page/local_utils/Chatting_Provider.dart';
import 'package:chat_app/screens/chatting_page/local_widgets/chatting_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ChattingPage extends StatefulWidget {
  const ChattingPage({Key key}) : super(key: key);

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  TextEditingController _controller;
  StreamSubscription _streamSubscription;

  bool firstLoad = true;
  @override
  void initState() {
    _controller = TextEditingController();
    var p=Provider.of<ChattingProvier>(context, listen:false);
    _streamSubscription= p.getSnapshot().listen((event){
      if(firstLoad){
        firstLoad=false;
        return;
      }
      p.addOne(ChattingModel.fromJson(event.docs[0].data()));
    });
    Future.microtask((){ //빌드된이후 실행되는 코드
      Provider.of<ChattingProvier>(context, listen:false).load();
    });
    super.initState();
  }
  @override
  void dispose(){
    _streamSubscription?.cancel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var p=Provider.of<ChattingProvier>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
                reverse: true,
            children: p.chattingList.map((e) => ChattingItem(chattingModel: e)).toList(),
          )),
          Divider(
            thickness: 1.5,
            height: 1.5,
            color: Colors.grey[300],
          ),
          Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * .5),
            margin:
                EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
                    child: TextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      controller: _controller,
                      style: TextStyle(fontSize: 27),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '텍스트 입력',
                          hintStyle: TextStyle(color: Colors.grey[400])),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    var text=_controller.text;
                    _controller.text='';
                    p.send(text);
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 20, 10),
                    child: Icon(
                      Icons.send,
                      size: 33,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
