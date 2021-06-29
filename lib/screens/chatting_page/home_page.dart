import 'package:chat_app/screens/chatting_page/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'local_utils/Chatting_Provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<AnimatedListState> _animListKey = GlobalKey<AnimatedListState>();
  TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  List<String> _chat = [];
  List<String> _image = [];

  @override
  Widget build(BuildContext context) {
    _image.add(
        "https://pds.joins.com/news/FbMetaImage/201905/df7f2b65-2da9-4cc7-8896-1e78dcf47f52.jpg");
    _image.insert(0,
        'https://pds.joins.com/news/FbMetaImage/201905/df7f2b65-2da9-4cc7-8896-1e78dcf47f52.jpg');
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 239, 241, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("ChatRoomTest"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.screen_share_outlined),
            tooltip: 'Hi!',
            onPressed: () => {},
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Hi!',
            onPressed: () => {},
          ),
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Wow',
            onPressed: () => {},
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: AnimatedList(
                  key: _animListKey, reverse: true, itemBuilder: _bulidItem)),
          Container(
            color: Colors.white,
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * .25),
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
                    child: TextField(
                      controller: _textEditingController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(hintText: "메세지 입력해 주세요"),
                      onSubmitted: _handleSubmitted
                      //펑션과 인자전달 구조가 똑같으면 이런식으로 표현 쌉가능
                      ,
                    ),
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

  Widget _bulidItem(context, index, animation) {
    return ChatMessage(
      _chat[index],
      "유저ID",
      image: _image[index],
      animation: animation,
    );
  }

  void _handleSubmitted(String text) {
    Logger().d(text);
    _image.insert(0, "");
    _textEditingController.clear(); //지워줘야함
    _chat.insert(0, text);
    _animListKey.currentState.insertItem(0);
  }
}
