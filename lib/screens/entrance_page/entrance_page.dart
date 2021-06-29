import 'package:chat_app/screens/chatting_page/ChattingPage.dart';
import 'package:chat_app/screens/chatting_page/home_page.dart';
import 'package:chat_app/screens/chatting_page/local_utils/Chatting_Provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class EntrancePage extends StatefulWidget {
  const EntrancePage({Key key}) : super(key: key);

  @override
  State<EntrancePage> createState() => _EntrancePageState();
}

class _EntrancePageState extends State<EntrancePage> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _controller,
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '닉네임',
                      hintStyle: TextStyle(color: Colors.grey[400])),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  var u=Uuid().v1();

                  print('u>$u');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ChangeNotifierProvider(
                            create: (context) => ChattingProvier(u,_controller.text),
                            child: ChattingPage(),
                            //ChattingPage
                          )));
                },
                child: Container(
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey[400]),
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    '방 입장하기',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  var u=Uuid().v1();

                  print('u>$u');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ChangeNotifierProvider(
                            create: (context) => ChattingProvier(u,_controller.text),
                            child: HomePage(),
                            //ChattingPage
                          )));
                },
                child: Container(
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey[400]),
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    '방2 입장하기',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
