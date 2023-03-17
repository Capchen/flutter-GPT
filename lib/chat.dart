import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:my_app/chatApi/api.dart';

var _chatList = [];

class ChatPage extends StatefulWidget {
  String? role;
  ChatPage(this.role, {super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  handleTap(String text) async {
    SmartDialog.showLoading();
    setState(() {
      _chatList.add(text);
    });
    var ans = await ask(text);
    // ans.listen((val) {
    //   print(1111);
    //   print(utf8.decode(val));
    // });
    setState(() {
      _chatList.add(ans);
      SmartDialog.dismiss();
    });
    // Fluttertoast.showToast(msg: ans, timeInSecForIosWeb: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: const ValueKey('chatListView'),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const Divider(color: Colors.transparent),
                itemCount: _chatList.length,
                itemBuilder: (context, index) => Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: 1400.0,
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 20,
                          ),
                          constraints: const BoxConstraints(minHeight: 85.0),
                          color:
                              index % 2 == 0 ? Colors.grey[200] : Colors.white,
                          // Text('${_chatList[index]}'),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              index % 2 == 0
                                  ? const Icon(
                                      Icons.face,
                                    )
                                  : const Icon(
                                      Icons.smart_toy,
                                    ),
                              Expanded(
                                child: Text('${_chatList[index]}',
                                    textAlign: TextAlign.left),
                              ),
                            ],
                          )),
                    )),
          ),
          const SizedBox(
            height: 10,
            width: 1400,
          ),
          Container(
            height: 65,
            width: 1400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ChatInput(
              role: widget.role,
              onPressed: handleTap,
            ),
          ),
          const SizedBox(
            height: 15,
            width: 1400,
          )
        ],
      ),
    );
    // return StreamBuilder(
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState != ConnectionState.done) {
    //       return ChatInput(
    //         onPressed: handleTap,
    //       );
    //     } else {
    //       print(snapshot);
    //     }
    //   },
    // );
  }
}

class ChatInput extends StatefulWidget {
  final ValueChanged<String> onPressed;
  final String? role;
  const ChatInput({super.key, required this.onPressed, this.role});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget.role ?? "");
    // TODO: implement
    // initState
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ChatInput oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    _textEditingController.text = widget.role ?? "";
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: TextField(
          autofocus: true,
          controller: _textEditingController,
          decoration: const InputDecoration(
            hintText: "请输入您的消息",
            contentPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            border: InputBorder.none,
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          widget.onPressed(_textEditingController.text);
          _textEditingController.text = '';
        },
        icon: const Icon(Icons.send),
        color: Colors.blue,
      ),
    ]);
  }
}
