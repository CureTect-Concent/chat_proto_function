import 'package:chat_app/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<AnimatedListState> _animListKey = GlobalKey<AnimatedListState>();
  TextEditingController _textEditingController = TextEditingController();

  List<String> _chat = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChatApp"),
      ),
      body: Column(
        children: [
          Expanded(
              child: AnimatedList(
                key: _animListKey,
            reverse: true,
            itemBuilder: _bulidItem
            )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(hintText: "메세지 입력해 주세요"),
                    onSubmitted: _handleSubmitted
                    //펑션과 인자전달 구조가 똑같으면 이런식으로 표현 쌉가능
                    ,
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                FlatButton(
                    onPressed: () {
                      _handleSubmitted(_textEditingController.text);
                    },
                    child: Text("보내기"),
                    color: Colors.amberAccent)
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _bulidItem(context, index, animation){
    return ChatMessage(_chat[index],animation:animation);
  }

  void _handleSubmitted(String text) {
    Logger().d(text);
    _textEditingController.clear();
    _chat.insert(0, text);
    _animListKey.currentState.insertItem(0);

  }
}
